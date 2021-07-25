//
//  HTTPMethod.swift
//
//
//  Created by carlhung on 3/12/2020.
//

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
