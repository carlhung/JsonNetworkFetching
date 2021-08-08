import Foundation
@testable import SimpleJsonNetworkFetching
import XCTest
#if os(Linux)
    import FoundationNetworking
#endif

final class SimpleJsonNetworkFetchingTests: XCTestCase {
    // let shared: JsonNetworkFetching = SimpleJsonNetworkFetching(session: URLSession.shared)
    let shared = SimpleJsonNetworkFetching(urlConfig: URLSessionConfiguration.default)
    // let uuid = "8a6b7d93-c0de-4171-86f6-70b349a1d345"
    // let headers = ["Content-Type": "application/json"]

    // func testExample() {
    //     // guard let firstURL = URL(string: "https://mobileapi.centanet.com/passport/v6/json/reply/InsertHKUserInfoRequest") else {
    //     //     print("failed to unwrap first url"); return
    //     // }

    //     // var firstResult: Result<USERIDReturned, NetworkFetchingError>?
    //     // shared.request(url: firstURL, httpMethod: .post(headers: headers, body: RequestUSERID.init(providerKey: uuid)), completionHandler: { (result: Result<USERIDReturned, NetworkFetchingError>) -> Void in
    //     //     firstResult = result
    //     // })
    //     // while firstResult == nil {}
    //     // // switch finalResult! {
    //     // // case let .failure(error):
    //     // //     switch error { // String(decoding: returnedData, as: UTF8.self)
    //     // //     case let .invalidStatusCode(statusCode, responseData: data):
    //     // //         guard let data = data else { return }
    //     // //         print("statusCode: \(statusCode), data: \(String(decoding: data, as:UTF8.self))")
    //     // //     default:
    //     // //         print("error: \(error)")
    //     // //     }
    //     // // case let .success(returnedUserID):
    //     // //     print("returned userID: \(returnedUserID)")
    //     // // }

    //     // guard case let .some(.success(returnedUserID)) = firstResult, let userID = returnedUserID.result else {
    //     //     print("failed in first returned data"); return
    //     // }

    //     // guard let secondURL = URL(string: "https://talk.centanet.com/im/020/Talk/GetToken") else {
    //     //     print("failed to unwrap second url"); return
    //     // }

    //     // var secondResult: Result<ReturnToken, NetworkFetchingError>?
    //     // let userID = "U120441784"
    //     // shared.request(url: secondURL, httpMethod: .post(headers: headers, body: RequestToken(userType: "U", cityCode: "852", userNo: userID, tokenType: 1)), completionHandler: { (result: Result<ReturnToken, NetworkFetchingError>) -> Void in
    //     //     secondResult = result
    //     // })
    //     // while secondResult == nil {}
    //     // switch secondResult! {
    //     // case .failure(let error):
    //     //     print("second error: \(error)")
    //     // case .success(let returnedVal):
    //     //     print("returnedToken: \(returnedVal)")
    //     // }

    //     let secondURL = URL(string: "https://talk.centanet.com/im/020/Talk/GetToken")!
    //     var isNotFinish = true
    //     shared.request(url: secondURL, httpMethod: .post(headers: headers, body: RequestToken(userType: "U", cityCode: "852", userNo: "U120441784", tokenType: 1)), completionHandler: { (result: Result<ReturnToken, NetworkFetchingError>) -> Void in
    //         if case let .success(returnedVal) = result {
    //             print(returnedVal)
    //         }
    //         isNotFinish = false
    //     })
    //     while isNotFinish {}
    // }

    // https://swift.org/builds/swift-5.3.1-release/ubuntu2004/swift-5.3.1-RELEASE/swift-5.3.1-RELEASE-ubuntu20.04.tar.gz
    func testExample() {
        var isNotFinish = true
        guard let url = URL(string: "https://github.com/apple/sourcekit-lsp/archive/main.zip") else {
            return
        }

        let result = shared.download(url: url, httpMethod: SimpleJsonNetworkFetching.get()) {
            switch $0 {
            // case let .success(url):
                // print("got the data, url: \(url.absoluteString)")
            case let .success(data):
                print("got the data")
            case let .failure(error):
                print("error: \(error)")
            }
            isNotFinish = false
        } progressHandler: {
            print("progress: \($0)")
        }

        switch result {
        case let .failure(error):
            print(error)
        case let .success(task):
            print("returned task")
        }

        while isNotFinish {}
    }

    // func testExample() {
    //     guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=8a372de9f49b4406cb9fd89dbd739801") else { print("wrong url"); return }
    //     var finalResult: Result<WeatherModel, NetworkFetchingError>?
    //     shared.request(url: url, httpMethod: SimpleJsonNetworkFetching.get(), completionHandler: { result in
    //         finalResult = result
    //     })
    //     while finalResult == nil {}

    //     switch finalResult {
    //     case let .success(returnedData):
    //         print("success: \(returnedData)")
    //     case let .failure(error):
    //         print("failure: \(error)")
    //     case .none:
    //         print("none")
    //     }
    // }

    //    TransactionSearch
    // func testExample() {
    //     var finalResult: Result<CLMGTransactionSearch, NetworkFetchingError>?
    //     let post = CLMPTransactionSearch(postType: "Sale", offset: 0, size: 10)
    //     let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
    //     // _ = SimpleJsonNetworkFetching.get(headers:headers) // get request.
    //     shared.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Transaction/Search")!, httpMethod: .post(headers: headers, body: post)) { result in
    //         finalResult = result
    //     }
    //     while finalResult == nil {}
    //     switch finalResult {
    //     case let .success(returnedData):
    //         print("success: \(returnedData)")

    //     case let .failure(error): print("error: \(error)")
    //     case .none: print("none")
    //     }
    // }

    //    getPostAutoComplete + postSearch

    // func testExample() {
    //     var finalResult: Result<CLMGGetPostFilterOptions, NetworkFetchingError>?
    //     let post = CLMPPostSearch(keyword: "s")
    //     let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
    //     share.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Post/GetPostAutoComplete")!,
    //                   httpMethod: HTTPMethod.post(headers: headers, body: post)) { result in
    //         finalResult = result
    //     }

    //     while finalResult == nil {}
    //     switch finalResult {
    //     case let .failure(error):
    //         print("getPostAutoComplete error: \(error)")
    //     case .none:
    //         print("getPostAutoComplete none")
    //     case let .success(returnedData):
    //         //            print("getPostAutoComplete success: \(returnedData)")

    //         // postSearch
    //         guard let aPost = returnedData.district?.first?.search else { return }
    //        var finalResult: Result<CLMGPostSearch, NetworkFetchingError>? // works
    //         // var finalResult: Result<Data, NetworkFetchingError>? // works
    //         // var finalResult: Result<String, NetworkFetchingError>? // works
    //         share.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Post/Search")!,
    //                       httpMethod: HTTPMethod.post(headers: headers, body: aPost)) { result in
    //             finalResult = result
    //         }
    //         // SimpleJsonNetworkFetching.get(headers: [String : String])
    //         while finalResult == nil {}
    //         switch finalResult {
    //         case let .failure(error):
    //             print("postSearch error: \(error)")
    //         case .none:
    //             print("postSearch none")
    //         case let .success(returnedData):
    //             print("postSearch success: \(returnedData)")
    //         }
    //     }
    // }

    static var allTests = [
        ("testExample", testExample),
    ]
}
