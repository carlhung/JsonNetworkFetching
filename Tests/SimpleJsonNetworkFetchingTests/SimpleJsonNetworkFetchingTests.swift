@testable import SimpleJsonNetworkFetching
import XCTest

struct Stump: Encodable {}

final class SimpleJsonNetworkFetchingTests: XCTestCase {
    func testExample() {
        let share = SimpleJsonNetworkFetching.shared
        share.request(url: URL(string: "")!, httpMethod: SimpleJsonNetworkFetching.get(headers: [:]), handler: { (result: Result<ST, NetworkFetchingError>) in
            switch result {
                case .failure(let error): print(error)
                case .success(_): print("success")
            }
        })
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

struct ST: Decodable {}
