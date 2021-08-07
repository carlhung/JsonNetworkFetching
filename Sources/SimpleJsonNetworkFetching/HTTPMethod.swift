//
//  HTTPMethod.swift
//
//
//  Created by carlhung on 3/12/2020.
//
import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public protocol Method {
    associatedtype EncodableBody: Encodable
    init(method: String, headers: [String: String], body: EncodableBody?)
    var method: String { get set }
    var headers: [String: String] { get set }
    var body: EncodableBody? { get set }
}

public struct HTTPMethod<T: Encodable>: Method {
    public typealias EncodableBody = T
    public var method: String
    public var headers: [String: String]
    public var body: T?

    public init(method: String, headers: [String: String], body: T?) {
        self.method = method
        self.headers = headers
        self.body = body
    }
}

public extension Method {
    static var get: String {
        return "GET"
    }

    static var post: String {
        return "POST"
    }

    static func get(headers: [String: String] = [:]) -> Self {
        return Self(method: Self.get, headers: headers, body: nil)
    }

    static func post(headers: [String: String] = [:], body: EncodableBody?) -> Self {
        return Self(method: Self.post, headers: headers, body: body)
    }
}

// MARK: - Stump struct

/// Stump struct for being used by `get`
public struct Stump: Encodable {}
public typealias MethodGet = HTTPMethod<Stump>


private func urlConstructer(scheme: String, host: String, path: String, queryItems: [(key: String, value: String)]) -> URL? {
    let queryItemArray = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
    let url = URLComponents(scheme: scheme, host: host, path: path, queryItems: queryItemArray).url
    return url
}

private extension URLComponents {
    init(scheme: String,// = "https",
         host: String,// = "www.google.com",
         path: String,// = "/search",
         queryItems: [URLQueryItem]) { // URLQueryItem(name: "q", value: "Formula One")
        self.init()
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
}

public extension URL {
    init?(scheme: String,// = "https",
        host: String,// = "www.google.com",
        path: String,// = "/search",
        queryItems:  [(key: String, value: String)]) { // URLQueryItem(name: "q", value: "Formula One")
        let urlStr = urlConstructer(scheme: scheme, host: host, path: path, queryItems: queryItems)?.absoluteString
        guard let urlStr = urlStr else {
            return nil
        }
        self.init(string: urlStr)
    }
}