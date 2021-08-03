//
//  FinishedOperationsPresenter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation

class FinishedOperationsPresenter: FinishedOperationsPresenterProtocol {
    
    weak var view: FinishedOperationsViewProtocol?
    private let router: FinishedOperationsRouterProtocol
    private var finishedOperations = [Question]()
        
    var numberFinished: Int {
        if finishedOperations.count > 0 {
            view?.showTableView()
            return finishedOperations.count
        }else {
            view?.hideTableView()
            return 0
        }
        
    }
        
    init(view: FinishedOperationsViewProtocol, router: FinishedOperationsRouterProtocol, finished: [Question]) {
        self.view = view
        self.router = router
        self.finishedOperations = finished
    }
   
    func configure(cell: OperationTableViewCell, indexPath: IndexPath) {
        let operation = finishedOperations[indexPath.row]
        cell.configureFinished(operation: operation)
    }
    
    func didAddNewQuestion(question: Question) {
        finishedOperations.append(question)
        self.view?.reloadData()
    }
    
    func dismiss() {
        router.dismiss()
    }
    
}

