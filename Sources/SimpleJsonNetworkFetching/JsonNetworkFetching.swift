import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public let defaultStatusCodeSet = Set(200 ... 299)
public let defaultURLRequestCachePolicy = URLRequest.CachePolicy.useProtocolCachePolicy
public let defaultURLRequestTimeoutInterval: TimeInterval = 60.0

public protocol JsonNetworkFetching {
    var session: URLSession { get set }
    init(session: URLSession)
    func request<T: Encodable>(url: URL, httpMethod: HTTPMethod<T>, statusCodeSet: Set<Int>, cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval, completionHandler: @escaping (Result<Data, NetworkFetchingError>) -> Void)
    func request<T: Encodable>(url: URL, httpMethod: HTTPMethod<T>, statusCodeSet: Set<Int>, cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval, completionHandler: @escaping (Result<String, NetworkFetchingError>) -> Void)
    func request<Output: Decodable, T: Encodable>(url: URL, httpMethod: HTTPMethod<T>, statusCodeSet: Set<Int>, cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval, completionHandler: @escaping (Result<Output, NetworkFetchingError>) -> Void)
    static func createRequest<T: Encodable>(url: URL, httpMethod: HTTPMethod<T>, cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval) -> Result<URLRequest, NetworkFetchingError>
    static func decodableDataHandler<Output: Decodable>(error: Error?, response: URLResponse?, data: Data?, statusCodeSet: Set<Int>) -> Result<Output, NetworkFetchingError>
    static func dataHandler(error: Error?, response: URLResponse?, data: Data?, statusCodeSet: Set<Int>) -> Result<Data, NetworkFetchingError>
}

// MARK: - all requests

public extension JsonNetworkFetching {
    /// This method returns the raw data.
    ///
    /// If you are sure the returned data is json string. you can use `String(decoding: returnedData, as: UTF8.self)` to print out the json string for generator to generate model.
    func request<T: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<T>,
        statusCodeSet: Set<Int> = defaultStatusCodeSet,
        cachePolicy: URLRequest.CachePolicy = defaultURLRequestCachePolicy,
        timeoutInterval: TimeInterval = defaultURLRequestTimeoutInterval,
        completionHandler: @escaping (Result<Data, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case let .success(returnedrequest):
            request = returnedrequest
        case let .failure(error):
            completionHandler(.failure(error))
            return
        }

        session.dataTask(with: request) { data, response, error in
            #if os(iOS) // || os(watchOS) //|| os(OSX)
                DispatchQueue.main.async {
                    let result = Self.dataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                    completionHandler(result)
                }
            //            #elseif
            #else
                let result = Self.dataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                completionHandler(result)
            #endif
        }
        .resume()
    }

    /// The method can return `String` from the response's data.
    func request<T: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<T>,
        statusCodeSet: Set<Int> = defaultStatusCodeSet,
        cachePolicy: URLRequest.CachePolicy = defaultURLRequestCachePolicy,
        timeoutInterval: TimeInterval = defaultURLRequestTimeoutInterval,
        completionHandler: @escaping (Result<String, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case let .success(returnedrequest):
            request = returnedrequest
        case let .failure(error):
            completionHandler(.failure(error))
            return
        }

        session.dataTask(with: request) { data, response, error in
            #if os(iOS)
                DispatchQueue.main.async {
                    let result = Self.dataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                    switch result {
                    case let .failure(error): completionHandler(.failure(error))
                    case let .success(returnedData): completionHandler(.success(String(decoding: returnedData, as: UTF8.self)))
                    }
                }
            #else
                let result = Self.dataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                switch result {
                case let .failure(error): completionHandler(.failure(error))
                case let .success(returnedData): completionHandler(.success(String(decoding: returnedData, as: UTF8.self)))
                }
            #endif
        }
        .resume()
    }

    /// This method returns Decodable Model
    ///
    /// The returned Model can be generated by model generator which conforming to Decodable.
    func request<Output: Decodable, T: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<T>,
        statusCodeSet: Set<Int> = defaultStatusCodeSet,
        cachePolicy: URLRequest.CachePolicy = defaultURLRequestCachePolicy,
        timeoutInterval: TimeInterval = defaultURLRequestTimeoutInterval,
        completionHandler: @escaping (Result<Output, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case let .success(returnedrequest):
            request = returnedrequest
        case let .failure(error):
            completionHandler(.failure(error))
            return
        }

        session.dataTask(with: request) { data, response, error in
            #if os(iOS)
                DispatchQueue.main.async {
                    let result: Result<Output, NetworkFetchingError> = Self.decodableDataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                    completionHandler(result)
                }
            #else
                let result: Result<Output, NetworkFetchingError> = Self.decodableDataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet)
                completionHandler(result)
            #endif
        }
        .resume()
    }
}

// MARK: - All Static Helpers

public extension JsonNetworkFetching {
    /// when wanting to use `GET`, use this static method instead of case `get` of HTTPMethod.
    static func get(headers: [String: String] = [:]) -> HTTPMethod<Stump> {
        return HTTPMethod<Stump>.get(headers: headers)
    }

    static func createRequest<T: Encodable>(url: URL,
                                            httpMethod: HTTPMethod<T>,
                                            cachePolicy: URLRequest.CachePolicy,
                                            timeoutInterval: TimeInterval) -> Result<URLRequest, NetworkFetchingError>
    {
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)

        switch httpMethod.method {
        case type(of: httpMethod).get, type(of: httpMethod).post:
            request.httpMethod = httpMethod.method
        default:
            return .failure(.unknownMethod)
        }

        if httpMethod.method == type(of: httpMethod).post {
            guard let body = httpMethod.body else {
                return .failure(.postRequestHasNoBody)
            }
            do {
                let data = try JSONEncoder().encode(body)
                request.httpBody = data
            } catch {
                return .failure(.encodeError(error))
            }
        }

        httpMethod.headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }

        return .success(request)
    }

    static func decodableDataHandler<Output: Decodable>(error: Error?, response: URLResponse?, data: Data?, statusCodeSet: Set<Int>) -> Result<Output, NetworkFetchingError> {
        let finalData: Data
        switch Self.dataHandler(error: error, response: response, data: data, statusCodeSet: statusCodeSet) {
        case let .failure(networkError):
            return .failure(networkError)
        case let .success(returnData):
            finalData = returnData
        }
        do {
            let decodedResponse = try JSONDecoder().decode(Output.self, from: finalData)
            return .success(decodedResponse)
        } catch {
            return .failure(.decodeError(error, responseData: data))
        }
    }

    static func dataHandler(error: Error?, response: URLResponse?, data: Data?, statusCodeSet: Set<Int>) -> Result<Data, NetworkFetchingError> {
        guard error == nil else {
            return .failure(.networkResponseError(message: error!))
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.notHttpResponse)
        }
        guard statusCodeSet.contains(httpResponse.statusCode) else {
            return .failure(.invalidStatusCode(httpResponse.statusCode, responseData: data))
        }
        guard let data = data else {
            return .failure(.failedToExtractData)
        }
        return .success(data)
    }
}