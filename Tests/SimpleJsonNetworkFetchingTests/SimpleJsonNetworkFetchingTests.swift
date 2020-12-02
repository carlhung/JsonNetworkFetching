@testable import SimpleJsonNetworkFetching
import XCTest

let rootAPI = "http://hkfp1.centanet.com/coredev/CentanetAPITest"


final class SimpleJsonNetworkFetchingTests: XCTestCase {
    
    let share = SimpleJsonNetworkFetching.shared
    
//    func testExample() {
//        var finalResult: Result<BranchDetail, NetworkFetchingError>?
//        share.request(url: URL(string: rootAPI + "/api/Branch/Detail")!, httpMethod: SimpleJsonNetworkFetching.get(headers: [:])) { (result: Result<BranchDetail, NetworkFetchingError>) in
//            finalResult = result
//        }
//        while finalResult == nil {}
//        if let unwrappedResult = finalResult {
//            switch unwrappedResult {
//            case .failure(let error): print("error: \(error)")
////            case .success(let val): print("value: \(val)")
//            case .success: print("testExample get success")
//            }
//        }
//    }
    
//    func testExample() {
//        var finalResult: Result<GetBranchFilterOptionsResponse, NetworkFetchingError>?
//
//        let body = GetBranchFilterOptionsRequestBody(keyword: "string", typeCodes: ["string"], bigestAndEstate: ["string"], dept: "RES", costCtr: "string", costCtrWebScopeIDs: ["string"], primarySchoolNets: ["string"], schools: ["string"], mtrs: ["string"], offset: 0, size: 0, autoCompleteZoomToBottomLayer: true, sort: "GeoDistance", order: "Ascending", geoFilter: GeoFilter(points: ["string"], zoom: 0, geoPoints: []), geoNearBy: GeoNearBy(latLng: "string", radius: 0))
//
//        let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]
//
//        share.request(url: URL(string: rootAPI + "/api/Branch/GetBranchFilterOptions")!, httpMethod: .post(headers: headers, body: body)) { (result: Result<GetBranchFilterOptionsResponse, NetworkFetchingError>) in
//            finalResult = result
//        }
//        while finalResult == nil {}
//        if let unwrappedResult = finalResult {
//            switch unwrappedResult {
//            case .failure(let error): print("error: \(error)")
//            case .success(let val): print("value: \(val)")
////            case .success: print("testExample post success")
//            }
//        }
//    }
    
    func testExample() {
        var finalResult: Result<ContactUsResponse, NetworkFetchingError>?
        
        let body = ContactUsRequestBody(title: "string", firstName: "string", lastName: "string", email: "string", contactRegion: "string", contact: "string", subject: "string", remark: "string", captchaID: "string", captchaCode: "string", directSaleApproved: true)

        let headers = ["accept": "text/plain", "Content-Type": "application/json-patch+json"]

        share.request(url: URL(string: rootAPI + "/api/Form/ContactUs")!, httpMethod: .post(headers: headers, body: body)) { (result: Result<ContactUsResponse, NetworkFetchingError>) in
            finalResult = result
        }
        while finalResult == nil {}
        if let unwrappedResult = finalResult {
            switch unwrappedResult {
            case .failure(let error):
                print("error: \(error)")
                if case let .invalidStatusCode(_, responseData: .some(data)) = error {
                    let str = String(decoding: data, as: UTF8.self)
                    print("response data string: \(str)")
                }
            case .success(let val): print("value: \(val)")
//            case .success: print("testExample post success")
            }
        }
    }

   static var allTests = [
       ("testExample", testExample),
   ]
}
