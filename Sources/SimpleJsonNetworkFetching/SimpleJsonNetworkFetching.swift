import Foundation
#if os(Linux)
    import FoundationNetworking
#endif
// NetworkFetchAndDownload
public class SimpleJsonNetworkFetching: NetworkFetchAndDownload {//NSObject & JsonNetworkFetching  {
    public required convenience init(urlConfig: URLSessionConfiguration) {
        self.init()
        self.session = URLSession(configuration: urlConfig, delegate: self, delegateQueue: nil)
    }

// public class SimpleJsonNetworkFetching: NetworkFetchAndDownload  {
    public var session: URLSession?
    public var downloadTasks: [GenericDownloadTask] = []
    required public override init() {}
}

// extension SimpleJsonNetworkFetching: URLSessionDataDelegate {

//     public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
//                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//         print("urlSession didReceive")
//         guard let task = downloadTasks.first(where: { $0.task == dataTask }) else {
//             completionHandler(.cancel)
//             return
//         }
//       task.expectedContentLength = response.expectedContentLength
//       completionHandler(.allow)
//    }

//     public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//         print("urlSession adding")
//       guard let task = downloadTasks.first(where: { $0.task == dataTask }) else {
//          return
//       }
//       task.buffer.append(data)
//       let percentageDownloaded = Double(task.buffer.count) / Double(task.expectedContentLength)
//       DispatchQueue.main.async {
//          task.progressHandler?(percentageDownloaded)
//       }
//    }

//     public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//         print("urlSession error")
//     guard let index = downloadTasks.firstIndex(where: { $0.task == task }) else {
//          return
//       }
//       let task = downloadTasks.remove(at: index)
//       DispatchQueue.main.async {
//          if let e = error {
//             task.completionHandler?(.failure(e))
//          } else {
//             task.completionHandler?(.success(task.buffer))
//          }
//       }
//    }
// }
