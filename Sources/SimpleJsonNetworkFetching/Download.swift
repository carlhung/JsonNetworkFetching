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
    var completionHandler: Result<Data, Error>.Completion? { get set }
    var progressHandler: ((Double) -> Void)? { get set }

    func resume()
    func suspend()
    func cancel()
}

public extension Result {
    typealias Completion = (Result<Success, Failure>) -> Void
}

public class GenericDownloadTask {
    public var completionHandler: Result<Data, Error>.Completion?
    public var progressHandler: ((Double) -> Void)?

    private(set) var task: URLSessionDataTask
    var expectedContentLength: Int64 = 0
    var buffer = Data()

    init(task: URLSessionDataTask) {
        self.task = task
    }
}

extension GenericDownloadTask: DownloadTask {
    public func resume() {
        task.resume()
    }

    public func suspend() {
        task.suspend()
    }

    public func cancel() {
        task.cancel()
    }
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