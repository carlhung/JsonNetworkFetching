import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

public class SimpleJsonNetworkFetching: NetworkFetchingData {
    public var session: URLSession?
    public var downloadTasks: [GenericDownloadDataTask] = []

    override public required init() {}
}


public class DownloadAndFetch: NetworkFetchingDownload {
    public var session: URLSession?
    public var downloadTasks: [GenericDownloadFileTask] = []

    override public required init() {}
}