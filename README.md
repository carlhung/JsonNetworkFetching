
# SimpleJsonNetworkFetching

This library is simply for fetching json only.

**Support Systems**

`iOS` and `Linux`
you can try adding/testing on other OSs.

**Usage**

if you want to use default `URLSession.shared`:

    let shared = SimpleJsonNetworkFetching(session: URLSession.shared)
    shared.request(url: url, httpMethod: method) { (result) in
        switch result {
        case .failure(let error)): break
        case .success(let aDecoableValue): break
        }
    }

`httpMethod` only supports `get` and `post`. `post` can carry a body of `Encodable`.

when wanting to do `get request`, use `SimpleJsonNetworkFetching.get(headers:)`, example:

    shared.request(url: url, httpMethod: SimpleJsonNetworkFetching.get(headers: ["accept": "text/plain"])...
    
when wanting to do `post request`, use `.post(headers:body:)`. `body` should be an `Encodable` value. example:

    shared.request(url: url, httpMethod: .post(headers: ["accept": "text/plain"], body: someEncodableValue)...
    
There are 3 different `request` which only the `completionHandler` are different.

    completionHandler: (Result<Output, NetworkFetchingError>) -> Void where Output: Decodable
    completionHandler: (Result<String, NetworkFetchingError>) -> Void
    completionHandler: (Result<Data, NetworkFetchingError>) -> Void

When using, type system may tell you It can't recognize which `request` you want to use. give it some hints:

    // replace SomeDecodable with any type conforms Decodable 
    shared.request(url: url, httpMethod:  SimpleJsonNetworkFetching.get(headers: headers)) { (result: Result<SomeDecodable, NetworkFetchingError>) in }
    
    // returning the string of response's data.
    shared.request(url: url, httpMethod:  SimpleJsonNetworkFetching.get(headers: headers)) { (result: Result<String, NetworkFetchingError>) in }
    
    // returning raw data
    shared.request(url: url, httpMethod:  SimpleJsonNetworkFetching.get(headers: headers)) { (result: Result<Data, NetworkFetchingError>) in }

**Custom Request**

This package only supports `get` and `set`, you may want to add methods, create your own implementation by conforming `JsonNetworkFetching`:

    struct MyJSONFetch: JsonNetworkFetching {
        var session: URLSession

        init(session: URLSession) {
            self.session = session
        }
    }

create your custom request by implementing `createRequest`:

    extension MyJSONFetch {
	    // this will override the original createRequest
        static func createRequest<T: Encodable>(url: URL,
                                                httpMethod: HTTPMethod<T>,
                                                cachePolicy: URLRequest.CachePolicy,
                                                timeoutInterval: TimeInterval) -> Result<URLRequest, NetworkFetchingError>
        {
            var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
            print("custom createRequest")
            if httpMethod.method == "DELETE" {
                request.httpMethod = httpMethod.method
                return .success(request)
            } else {
                return .failure(.unknownMethod)
            }
        }
    }
	
use your own custom `MyJSONFetch`:

    let fetch: JsonNetworkFetching = MyJSONFetch(session: URLSession.shared)
	fetch.request(url: URL(string: "http://www.xxx.com")!, httpMethod: HTTPMethod<Stump>.init(method: "DELETE", headers: [:], body: nil)) { (_: Result<Data, NetworkFetchingError>) in /* .... */ }

**Installation**

    .package(url: "https://github.com/carlhung/JsonNetworkFetching.git", .upToNextMajor(from: "1.0.0"))
