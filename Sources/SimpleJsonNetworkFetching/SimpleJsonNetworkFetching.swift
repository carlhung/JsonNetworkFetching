import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public class SimpleJsonNetworkFetching: NetworkFetchingData {
    public var session: URLSession?
    public var downloadTasks: [GenericDownloadDataTask] = []

    override public required init() {}
}


