import Foundation
@testable import SimpleJsonNetworkFetching
import XCTest
#if os(Linux)
    import FoundationNetworking
#endif

final class SimpleJsonNetworkFetchingTests: XCTestCase {
    let shared: JsonNetworkFetching = SimpleJsonNetworkFetching(session: URLSession.shared)

    //    TransactionSearch
    func testExample() {
        var finalResult: Result<CLMGTransactionSearch, NetworkFetchingError>?
        let post = CLMPTransactionSearch(postType: "Sale", offset: 0, size: 10)
        let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
        // _ = SimpleJsonNetworkFetching.get(headers:headers) // get request.
        shared.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Transaction/Search")!, httpMethod: .post(headers: headers, body: post)) { result in
            finalResult = result
        }
        while finalResult == nil {}
        switch finalResult {
        case let .success(returnedData):
            print("success: \(returnedData)")

        case let .failure(error): print("error: \(error)")
        case .none: print("none")
        }
    }

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
