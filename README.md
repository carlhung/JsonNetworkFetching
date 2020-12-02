
# SimpleJsonNetworkFetching

This library is simply for fetching json only.

**Support Systems**

`iOS` and `Linux`
you can try adding/testing on other OSs.

**Usage**

use default `URLSession.shared`:
`let shared = SimpleJsonNetworkFetching.shared`

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


**Installation**

    .package(url: "https://github.com/carlhung/JsonNetworkFetching.git", .upToNextMajor(from: "1.0.0"))
