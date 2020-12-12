import Foundation
@testable import SimpleJsonNetworkFetching
import XCTest
#if os(Linux)
    import FoundationNetworking
#endif

final class SimpleJsonNetworkFetchingTests: XCTestCase {

    // let shared: JsonNetworkFetching = SimpleJsonNetworkFetching(session: URLSession.shared)
    let shared: JsonNetworkFetching = SimpleJsonNetworkFetching(urlConfig: URLSessionConfiguration.default)

    // // https://swift.org/builds/swift-5.3.1-release/ubuntu2004/swift-5.3.1-RELEASE/swift-5.3.1-RELEASE-ubuntu20.04.tar.gz
    func testExample() {
        var isNotFinish = true
        guard let url = URL(string: "https://github.com/apple/sourcekit-lsp/archive/main.zip") else {
            return
        }

        switch shared.download(url: url, httpMethod: SimpleJsonNetworkFetching.get()) {
        case .failure(let error):
            print(error)
            isNotFinish = false
        case .success(var task):
            task.completionHandler = {
                switch $0 {
                case .success(let data):
                    print("got the data")
                case .failure(let error):
                    print("error: \(error)")
                }
                isNotFinish = false
            }
            task.progressHandler = {
                print("progress: \($0)")
            }
            task.resume()
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
