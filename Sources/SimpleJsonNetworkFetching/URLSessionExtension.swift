//
//  URLSessionExtension.swift
//  
//
//  Created by Carl Hung on 10/12/2020.
//

import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public extension URLSession {
    func request<Output: Decodable, Input: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<Input>,
        statusCodeSet: Set<Int> = Set(200 ... 299),
        cachePolicy: URLRequest.CachePolicy = URLRequest.CachePolicy.useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0,
        completionHandler: @escaping (Result<Output, NetworkFetchingError>) -> Void
    ) {
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)

        switch httpMethod.method {
        case "GET", "POST":
            request.httpMethod = httpMethod.method
        default:
            completionHandler(.failure(.unknownMethod))
            return
        }

        if httpMethod.method == "POST" {
            guard let body = httpMethod.body else {
                completionHandler(.failure(.postRequestHasNoBody))
                return
            }
            do {
                let data = try JSONEncoder().encode(body)
                request.httpBody = data
            } catch {
                completionHandler(.failure(.encodeError(error)))
                return
            }
        }

        httpMethod.headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }

        self.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(.failure(.networkResponseError(message: error!)))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(.notHttpResponse))
                    return
                }
                guard statusCodeSet.contains(httpResponse.statusCode) else {
                    completionHandler(.failure(.invalidStatusCode(httpResponse.statusCode, responseData: data)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(.failedToExtractData))
                    return
                }
                do {
                    let decodedResponse = try JSONDecoder().decode(Output.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(.decodeError(error, responseData: data)))
                }
            }
        }
        .resume()
    }
}
