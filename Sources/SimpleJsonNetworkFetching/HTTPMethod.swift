//
//  HTTPMethod.swift
//
//
//  Created by carlhung on 3/12/2020.
//

public struct HTTPMethod<T: Encodable> {
    public let method: String
    public let headers: [String: String]
    public let body: T?

    public init(method: String, headers: [String: String], body: T?) {
        self.method = method
        self.headers = headers
        self.body = body
    }
}

public extension HTTPMethod {
    static var get: String {
        return "GET"
    }

    static var post: String {
        return "POST"
    }

    static func get(headers: [String: String] = [:]) -> Self {
        return Self(method: Self.get, headers: headers, body: nil)
    }

    static func post(headers: [String: String] = [:], body: T?) -> Self {
        return Self(method: Self.post, headers: headers, body: body)
    }
}

// MARK: - Stump struct

/// Stump struct for being used by `get`
public struct Stump: Encodable {}
