//
//  HTTPMethod.swift
//  
//
//  Created by carlhung on 3/12/2020.
//

public enum HTTPMethod<T: Encodable> {
    /// Don't use this enum case, use `SimpleJsonNetworkFetching`'s `get` static method.
    case get(headers: [String: String])
    case post(headers: [String: String], body: T)
}

// MARK: - Stump struct
/// Stump struct for being used by `get`
public struct Stump: Encodable {}
