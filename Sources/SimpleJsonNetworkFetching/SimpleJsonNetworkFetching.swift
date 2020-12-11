import Foundation
#if os(Linux)
    import FoundationNetworking
#endif


public class SimpleJsonNetworkFetching: NSObject, JsonNetworkFetching, URLSessionDataDelegate {
    public var downloadTasks: [GenericDownloadTask] = []
    public var session: URLSession
    required public init(session: URLSession) {
        self.session = session
    }
}

// extension SimpleJsonNetworkFetching: URLSessionDataDelegate {

//     public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
//                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {

//       guard let task = downloadTasks.first(where: { $0.task == dataTask }) else {
//          completionHandler(.cancel)
//          return
//       }
//       task.expectedContentLength = response.expectedContentLength
//       completionHandler(.allow)
//    }

//     public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
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
