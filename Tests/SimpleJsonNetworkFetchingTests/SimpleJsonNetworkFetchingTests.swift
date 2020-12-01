@testable import SimpleJsonNetworkFetching
import XCTest

struct Stump: Encodable {}

final class SimpleJsonNetworkFetchingTests: XCTestCase {
    func testExample() {
        let share = SimpleJsonNetworkFetching.shared
        share.request(url: URL(string: "")!, httpMethod: SimpleJsonNetworkFetching.get(headers: [:]), handler: { (_: Result<ST, NetworkFetchingError>) in

        })
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

struct ST: Decodable {}
