import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public struct SimpleJsonNetworkFetching: JsonNetworkFetching {
    public var session: URLSession
    public init(session: URLSession) {
        self.session = session
    }
}
