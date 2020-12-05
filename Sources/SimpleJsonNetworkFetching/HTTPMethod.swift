//
//  HTTPMethod.swift
//
//
//  Created by carlhung on 3/12/2020.
//

public protocol HTTPMethodBase {
    associatedtype Body: Encodable
    var method: String { get }
    var headers: [String: String] { get }
    var body: Body? { get }
}

public struct HTTPMethod<T: Encodable>: HTTPMethodBase {
    public let method: String
    public let headers: [String: String]
    public let body: T?

    public static func get(headers: [String: String]) -> Self {
        return Self(method: Self.get, headers: headers, body: nil)
    }

    public static func post(headers: [String: String], body: T) -> Self {
        return Self(method: Self.post, headers: headers, body: body)
    }

    static var get: String {
        return "GET"
    }

    static var post: String {
        return "POST"
    }
}

// MARK: - Stump struct

/// Stump struct for being used by `get`
public struct Stump: Encodable {}
