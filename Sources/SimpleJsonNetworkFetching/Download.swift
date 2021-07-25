//
//  File.swift
//
//
//  Created by Carl Hung on 8/12/2020.
//

import Foundation
#if os(Linux)
    import FoundationNetworking
#endif

// // https://stackoverflow.com/questions/30543806/get-progress-from-datataskwithurl-in-swift/45290601

public protocol DownloadTask {
    associatedtype DownloadedData
    associatedtype AnyNumber: Numeric
    associatedtype SessionTask: URLSessionTask
    
    /// Don't call it.
    init()
    init(task: SessionTask, progressHandler: ((AnyNumber) -> Void)?, completionHandler: ((Result<DownloadedData, Error>) -> Void)?)
    
    var completionHandler: ((Result<DownloadedData, Error>) -> Void)? { get set }
    var progressHandler: ((AnyNumber) -> Void)? { get set }
    var task: SessionTask? { get set }
    func resume()
    func suspend()
    func cancel()
}

extension DownloadTask {
    
    public init(task: SessionTask, progressHandler: ((AnyNumber) -> Void)? = nil, completionHandler: ((Result<DownloadedData, Error>) -> Void)? = nil) {
        self.init()
        self.task = task
        self.progressHandler = progressHandler
        self.completionHandler = completionHandler
    }
    
    public func resume() {
        task?.resume()
    }

    public func suspend() {
        task?.suspend()
    }

    public func cancel() {
        task?.cancel()
    }
}

public struct GenericDownloadDataTask: DownloadTask {
    
    public init() {}
    
    public var completionHandler: ((Result<Data, Error>) -> Void)?
    public var progressHandler: ((Double) -> Void)?

    public var task: URLSessionDataTask?
    var expectedContentLength: Int64 = 0
    var buffer = Data()
}

public struct GenericDownloadFileTask: DownloadTask {

    public init() {}

    public var completionHandler: ((Result<URL, Error>) -> Void)?
    public var progressHandler: ((Double) -> Void)?

    public var task: URLSessionDownloadTask?
    // var expectedContentLength: Int64 = 0
    // var buffer = Data()
}

// public class GenericDownloadTask {
//     public var completionHandler: Result<Data, Error>.Completion?
//     public var progressHandler: ((Int64) -> Void)?

//     private(set) var task: URLSessionDownloadTask
//     var expectedContentLength: Int64 = 0
//     var buffer = Data()

//     init(task: URLSessionDownloadTask) {
//         self.task = task
//     }
// }

// extension GenericDownloadTask: DownloadTask {
//     public func resume() {
//         task.resume()
//     }

//     public func suspend() {
//         task.suspend()
//     }

//     public func cancel() {
//         task.cancel()
//     }
// }
