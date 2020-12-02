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
    public func request<Output: Decodable, Input: Encodable>(
        url: URL,
        httpMethod: HTTPMethod<Input>,
        statusCode: Range<Int> = Range(200 ... 299),
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0,
        completionHandler: @escaping (Result<Output, NetworkFetchingError>) -> Void
    ) {
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
                completionHandler(.failure(.encodeError(error)))
                return
            }
        }
        
        session.dataTask(with: request) { data, response, error in
            #if os(iOS)// || os(watchOS) //|| os(OSX)
            DispatchQueue.main.async {
                let result: Result<Output, NetworkFetchingError> = Self.handler(error: error, response: response, data: data, statusCode: statusCode)
                completionHandler(result)
            }
//            #elseif
            #else
            let result: Result<Output, NetworkFetchingError> = Self.handler(error: error, response: response, data: data, statusCode: statusCode)
            completionHandler(result)
            #endif
        }
        .resume()
    }
    
    private static func handler<Output: Decodable>(error: Error?, response: URLResponse?, data: Data?, statusCode: Range<Int>) -> Result<Output, NetworkFetchingError> {
        guard error == nil else {
            return .failure(.networkResponseError(message: error!))
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.notHttpResponse)
        }
        guard statusCode ~= httpResponse.statusCode else {
            return .failure(.invalidStatusCode(httpResponse.statusCode, responseData: data))
        }
        guard let data = data else {
            return .failure(.failedToExtractData)
        }
        do {
            let decodedResponse = try JSONDecoder().decode(Output.self, from: data)
            return .success(decodedResponse)
        } catch {
            return .failure(.decodeError(error, responseData: data))
        }
    }
    
    /// using session of `URLSession.shared`
    public static let shared = Self()
    
    private var session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// when wanting to use `GET`, use this static method instead of case `get` of HTTPMethod.
    public static func get(headers: [String: String]) -> HTTPMethod<Stump> {
        return HTTPMethod<Stump>.get(headers: headers)
    }
}


