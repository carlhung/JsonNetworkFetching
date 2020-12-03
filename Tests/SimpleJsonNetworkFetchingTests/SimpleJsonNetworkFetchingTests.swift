@testable import SimpleJsonNetworkFetching
import XCTest

final class SimpleJsonNetworkFetchingTests: XCTestCase {
    
    let share = SimpleJsonNetworkFetching.shared
    
    //    TransactionSearch
    //    func testExample() {
    //        var finalResult: Result<CLMGTransactionSearch, NetworkFetchingError>?
    //        let post = CLMPTransactionSearch(postType: "Sale", offset: 0, size: 10)
    //        let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
    //        share.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Transaction/Search")!, httpMethod: .post(headers: headers, body: post)) { (result) in
    //            finalResult = result
    //        }
    //        while finalResult == nil {}
    //        switch finalResult {
    //        case .success(let returnedData):
    //            print("success: \(returnedData)")
    //
    //        case .failure(let error): print("error: \(error)")
    //        case .none: print("none")
    //        }
    //    }
    
    //    getPostAutoComplete + postSearch
    func testExample() {
        var finalResult: Result<CLMGGetPostFilterOptions, NetworkFetchingError>?
        let post = CLMPPostSearch(keyword: "s")
        let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
        share.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Post/GetPostAutoComplete")!,
                      httpMethod: .post(headers: headers, body: post)) { (result) in
            finalResult = result
        }
        while finalResult == nil {}
        switch finalResult {
        case .failure(let error):
            print("getPostAutoComplete error: \(error)")
        case .none:
            print("getPostAutoComplete none")
        case .success(let returnedData):
            //            print("getPostAutoComplete success: \(returnedData)")
            
            // postSearch
            guard let aPost = returnedData.district?.first?.search else { return }
//            var finalResult: Result<CLMGPostSearch, NetworkFetchingError>?
//            var finalResult: Result<Data, NetworkFetchingError>?
            var finalResult: Result<String, NetworkFetchingError>?
            share.request(url: URL(string: "http://hkfp2.centanet.com" + "/mapproject/api/Post/Search")!,
                          httpMethod: .post(headers: headers, body: aPost)) { (result) in
                finalResult = result
            }
            while finalResult == nil {}
            switch finalResult {
            case .failure(let error):
                print("postSearch error: \(error)")
            case .none:
                print("postSearch none")
            case .success(let returnedData):
                print("postSearch success: \(returnedData)")
            }
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
