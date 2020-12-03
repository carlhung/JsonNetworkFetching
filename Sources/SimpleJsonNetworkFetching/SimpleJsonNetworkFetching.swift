import Foundation
#if os(Linux)
import FoundationNetworking
#endif

public struct Stump: Encodable {}

public enum HTTPMethod<T: Encodable> {
    /// Don't use this enum case, use `SimpleJsonNetworkFetching`'s `get` static method.
    case get(headers: [String: String])
    case post(headers: [String: String], body: T)
}

public enum NetworkFetchingError: Error {
    case encodeError(Error)
    case networkResponseError(message: Error)
    case notHttpResponse
    case invalidStatusCode(Int, responseData: Data?)
    case failedToExtractData
    case decodeError(Error, responseData: Data?)
}

public struct SimpleJsonNetworkFetching {
    
    /// using session of `URLSession.shared`
    public static let shared = Self()
    
    /// when wanting to use `GET`, use this static method instead of case `get` of HTTPMethod.
    public static func get(headers: [String: String]) -> HTTPMethod<Stump> {
        return HTTPMethod<Stump>.get(headers: headers)
    }
    
    private static func createRequest<Input: Encodable>(url: URL,
                                                        httpMethod: HTTPMethod<Input>,
                                                        cachePolicy: URLRequest.CachePolicy,
                                                        timeoutInterval: TimeInterval) -> Result<URLRequest, NetworkFetchingError> {
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        switch httpMethod {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        switch httpMethod {
        case let .get(headers: dict), .post(headers: let dict, body: _):
            dict.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        if case let .post(_, body) = httpMethod {
            do {
                let data = try JSONEncoder().encode(body)
                request.httpBody = data
            } catch {
                return .failure(.encodeError(error))
            }
        }
        return .success(request)
    }
    
    private static func decodableDataHandler<Output: Decodable>(error: Error?, response: URLResponse?, data: Data?, statusCodeRange: Range<Int>) -> Result<Output, NetworkFetchingError> {
        let finalData: Data
        switch Self.dataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange) {
        case .failure(let networkError):
            return .failure(networkError)
        case .success(let returnData):
            finalData = returnData
        }
        do {
            let decodedResponse = try JSONDecoder().decode(Output.self, from: finalData)
            return .success(decodedResponse)
        } catch {
            return .failure(.decodeError(error, responseData: data))
        }
    }
    
    private static func dataHandler(error: Error?, response: URLResponse?, data: Data?, statusCodeRange: Range<Int>) -> Result<Data, NetworkFetchingError> {
        guard error == nil else {
            return .failure(.networkResponseError(message: error!))
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.notHttpResponse)
        }
        guard statusCodeRange ~= httpResponse.statusCode else {
            return .failure(.invalidStatusCode(httpResponse.statusCode, responseData: data))
        }
        guard let data = data else {
            return .failure(.failedToExtractData)
        }
        return .success(data)
    }
    
    private var session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// This method returns the raw data.
    ///
    /// If you are sure the returned data is json string. you can use `String(decoding: returnedData, as: UTF8.self)` to print out the json string for generator to generate model.
    public func request<Input: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<Input>,
        statusCodeRange: Range<Int> = Range(200 ... 299),
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0,
        completionHandler: @escaping (Result<Data, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case .success(let returnedrequest):
            request = returnedrequest
        case .failure(let error):
            completionHandler(.failure(error))
            return
        }
        
        session.dataTask(with: request) { data, response, error in
            #if os(iOS)// || os(watchOS) //|| os(OSX)
            DispatchQueue.main.async {
                let result = Self.dataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
                completionHandler(result)
            }
            //            #elseif
            #else
            let result = Self.dataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
            completionHandler(result)
            #endif
        }
        .resume()
    }
    
    /// The method can return `String` from the response.
    public func request<Input: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<Input>,
        statusCodeRange: Range<Int> = Range(200 ... 299),
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0,
        completionHandler: @escaping (Result<String, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case .success(let returnedrequest):
            request = returnedrequest
        case .failure(let error):
            completionHandler(.failure(error))
            return
        }
        
        session.dataTask(with: request) { data, response, error in
            #if os(iOS)
            DispatchQueue.main.async {
                let result = Self.dataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
                switch result {
                case .failure(let error): completionHandler(.failure(error))
                case .success(let returnedData): completionHandler(.success(String(decoding: returnedData, as: UTF8.self)))
                }
            }
            #else
            let result = Self.dataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
            switch result {
            case .failure(let error): completionHandler(.failure(error))
            case .success(let returnedData): completionHandler(.success(String(decoding: returnedData, as: UTF8.self)))
            }
            #endif
        }
        .resume()
    }
    
    /// This method returns Decodable Model
    ///
    /// The returned Model can be generated by model generator which conforming to Decodable.
    public func request<Output: Decodable, Input: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<Input>,
        statusCodeRange: Range<Int> = Range(200 ... 299),
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0,
        completionHandler: @escaping (Result<Output, NetworkFetchingError>) -> Void
    ) {
        let request: URLRequest
        switch Self.createRequest(url: url, httpMethod: httpMethod, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) {
        case .success(let returnedrequest):
            request = returnedrequest
        case .failure(let error):
            completionHandler(.failure(error))
            return
        }
        
        session.dataTask(with: request) { data, response, error in
            #if os(iOS)
            DispatchQueue.main.async {
                let result: Result<Output, NetworkFetchingError> = Self.decodableDataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
                completionHandler(result)
            }
            #else
            let result: Result<Output, NetworkFetchingError> = Self.decodableDataHandler(error: error, response: response, data: data, statusCodeRange: statusCodeRange)
            completionHandler(result)
            #endif
        }
        .resume()
    }
}


