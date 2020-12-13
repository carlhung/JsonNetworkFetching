import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public class SimpleJsonNetworkFetching: NetworkFetchAndDownload {

    public var session: URLSession?
    public var downloadTasks: [GenericDownloadTask] = []

    override public required init() {}
}
