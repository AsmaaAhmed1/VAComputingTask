//
//  OperationsPresenter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class OperationsPresenter: OperationsPresenterProtocol, OperationQuestionsProtocol, OperationsOutputInteractor {
    
    weak var view: OperationsViewProtocol?
    private let router: OperationsRouterProtocol?
    private let interactor: OperationsInputInteractor?
    private var pendingOperations = [Question]()
    private var finishedOperations = [Question]()
    
        
    var numberOfPending: Int {
        if pendingOperations.count > 0 {
            view?.showTableView()
            return pendingOperations.count
        }else {
            view?.hideTableView()
            return 0
        }
    }
    
    var numberOfFinished: Int {
        return finishedOperations.count
    }
        
    init(view: OperationsViewProtocol?, router: OperationsRouterProtocol?, interactor: OperationsInputInteractor?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    /// excutes the operation on the numbers array
    /// - Parameters:
    ///   - numbers: the array of numbers enterd by the user
    ///   - mathOp: the operation to be excuted
    /// - Returns: the result of the function as Integer
    func excuteOperation(numbers: [Int], mathOp: (Int, Int) -> Int) -> Int {
        var result = numbers[0]
        for i in 1...numbers.count - 1 {
            result = mathOp(result, numbers[i])
        }
        return result
    }
    
    func configure(cell: OperationTableViewCell, indexPath: IndexPath) {
        let operation = pendingOperations[indexPath.row]
        cell.configurePending(operation: operation)
    }
    
    func didAddNewQuestion(question: Question) {
        pendingOperations.append(question)
        self.view?.reloadData()
        interactor?.addOperationToQueue(operation: question)
    }
    
    
    func navigateToQuestionVC() {
        router?.navigateToQuestionVC(delegate: self)
    }
    
    func navigateToFinished() {
        router?.navigateToFinishedVC(finished: finishedOperations)
    }
    
    func didFinishWaitTime(operation: Question) {
        operation.result = self.excuteOperation(numbers: operation.numbers, mathOp: operation.op)
        self.pendingOperations.removeAll{$0.id == operation.id}
        self.finishedOperations.append(operation)
        DispatchQueue.main.async {
            self.view?.reloadData()
        }    }
    
}

