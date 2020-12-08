//
//  File.swift
//  
//
//  Created by Carl Hung on 8/12/2020.
//

import Foundation

// // https://stackoverflow.com/questions/30543806/get-progress-from-datataskwithurl-in-swift/45290601
protocol DownloadTask {

//   var completionHandler: ResultType<Data>.Completion? { get set }
    var completionHandler: Result<Data, Error>.Completion? { get set }
   var progressHandler: ((Double) -> Void)? { get set }

   func resume()
   func suspend()
   func cancel()
}

public extension Result {
    typealias Completion = (Result<Success, Failure>) -> Void
}

//public enum ResultType<T> {
//
//   public typealias Completion = (ResultType<T>) -> Void
//
//   case success(T)
//   case failure(Swift.Error)
//
//}

class GenericDownloadTask {

   var completionHandler: Result<Data, Error>.Completion?
   var progressHandler: ((Double) -> Void)?

   private(set) var task: URLSessionDataTask
   var expectedContentLength: Int64 = 0
   var buffer = Data()

   init(task: URLSessionDataTask) {
      self.task = task
   }

   deinit {
      print("Deinit: \(task.originalRequest?.url?.absoluteString ?? "")")
   }

}

extension GenericDownloadTask: DownloadTask {

   func resume() {
      task.resume()
   }

   func suspend() {
      task.suspend()
   }

   func cancel() {
      task.cancel()
   }
}

final class DownloadService: NSObject {

   private var session: URLSession!
   private var downloadTasks = [GenericDownloadTask]()

   public static let shared = DownloadService()

   private override init() {
      super.init()
      let configuration = URLSessionConfiguration.default
      session = URLSession(configuration: configuration,
                           delegate: self, delegateQueue: nil)
   }

   func download(request: URLRequest) -> DownloadTask {
      let task = session.dataTask(with: request)
      let downloadTask = GenericDownloadTask(task: task)
      downloadTasks.append(downloadTask)
      return downloadTask
   }
}


extension DownloadService: URLSessionDataDelegate {

   func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
                   completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {

      guard let task = downloadTasks.first(where: { $0.task == dataTask }) else {
         completionHandler(.cancel)
         return
      }
      task.expectedContentLength = response.expectedContentLength
      completionHandler(.allow)
   }

   func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
      guard let task = downloadTasks.first(where: { $0.task == dataTask }) else {
         return
      }
      task.buffer.append(data)
      let percentageDownloaded = Double(task.buffer.count) / Double(task.expectedContentLength)
      DispatchQueue.main.async {
         task.progressHandler?(percentageDownloaded)
      }
   }

   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    guard let index = downloadTasks.firstIndex(where: { $0.task == task }) else {
         return
      }
      let task = downloadTasks.remove(at: index)
      DispatchQueue.main.async {
         if let e = error {
            task.completionHandler?(.failure(e))
         } else {
            task.completionHandler?(.success(task.buffer))
         }
      }
   }
}

// MARK: - Usage: Example how to run two download tasks in parallel (macOS App):
/*
 class ViewController: NSViewController {

    @IBOutlet fileprivate weak var loadImageButton1: NSButton!
    @IBOutlet fileprivate weak var loadProgressIndicator1: NSProgressIndicator!
    @IBOutlet fileprivate weak var imageView1: NSImageView!

    @IBOutlet fileprivate weak var loadImageButton2: NSButton!
    @IBOutlet fileprivate weak var loadProgressIndicator2: NSProgressIndicator!
    @IBOutlet fileprivate weak var imageView2: NSImageView!

    fileprivate var downloadTask1:  DownloadTask?
    fileprivate var downloadTask2:  DownloadTask?

    override func viewDidLoad() {
       super.viewDidLoad()
       loadImageButton1.target = self
       loadImageButton1.action = #selector(startDownload1(_:))
       loadImageButton2.target = self
       loadImageButton2.action = #selector(startDownload2(_:))
    }

 }


 extension ViewController {

    @objc fileprivate func startDownload1(_ button: NSButton) {
       let url = URL(string: "http://localhost:8001/?imageID=01&tilestamp=\(Date.timeIntervalSinceReferenceDate)")!
       let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
       downloadTask1 = DownloadService.shared.download(request: request)
       downloadTask1?.completionHandler = { [weak self] in
          switch $0 {
          case .failure(let error):
             print(error)
          case .success(let data):
             print("Number of bytes: \(data.count)")
             self?.imageView1.image = NSImage(data: data)
          }
          self?.downloadTask1 = nil
          self?.loadImageButton1.isEnabled = true
       }
       downloadTask1?.progressHandler = { [weak self] in
          print("Task1: \($0)")
          self?.loadProgressIndicator1.doubleValue = $0
       }

       loadImageButton1.isEnabled = false
       imageView1.image = nil
       loadProgressIndicator1.doubleValue = 0
       downloadTask1?.resume()
    }

    @objc fileprivate func startDownload2(_ button: NSButton) {
       let url = URL(string: "http://localhost:8002/?imageID=02&tilestamp=\(Date.timeIntervalSinceReferenceDate)")!
       let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
       downloadTask2 = DownloadService.shared.download(request: request)
       downloadTask2?.completionHandler = { [weak self] in
          switch $0 {
          case .failure(let error):
             print(error)
          case .success(let data):
             print("Number of bytes: \(data.count)")
             self?.imageView2.image = NSImage(data: data)
          }
          self?.downloadTask2 = nil
          self?.loadImageButton2.isEnabled = true
       }
       downloadTask2?.progressHandler = { [weak self] in
          print("Task2: \($0)")
          self?.loadProgressIndicator2.doubleValue = $0
       }

       loadImageButton2.isEnabled = false
       imageView2.image = nil
       loadProgressIndicator2.doubleValue = 0
       downloadTask2?.resume()
    }
 }
 */
