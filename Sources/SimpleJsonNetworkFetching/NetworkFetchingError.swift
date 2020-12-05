//
//  NetworkFetchingError.swift
//
//
//  Created by carlhung on 3/12/2020.
//

import Foundation

// MARK: -

public enum NetworkFetchingError: Error {
    case encodeError(Error)
    case networkResponseError(message: Error)
    case notHttpResponse
    case invalidStatusCode(Int, responseData: Data?)
    case failedToExtractData
    case decodeError(Error, responseData: Data?)
    case unknownMethod
    case postRequestHasNoBody
}
