//
//  OperationsInteractor.swift
//  VA Computing Technical Task
//
//  Created by user200143 on 8/3/21.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class OperationsInteractor: OperationsInputInteractor {
    weak var presenter: OperationsPresenter?
    
    var operationQueue = OperationQueue()
    
    /// adds new question to the operations queue
    /// - Parameter operation: the question object containing the numbers array, the wait time and the operation to be excuted
    func addOperationToQueue(operation: Question) {
        operationQueue.addOperation { [unowned self] in
            self.operationQueue.schedule(after: .init(operation.date ), tolerance: .zero, options: .none, {
                presenter?.didFinishWaitTime(operation: operation)
            })
        }
    }
}
