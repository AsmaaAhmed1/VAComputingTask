//
//  OperationsView.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
protocol OperationsViewProtocol: class {
    var presenter: OperationsPresenter! {get set}
    func hideTableView()
    func showTableView()
    func reloadData()
}

protocol OperationsPresenterProtocol: class {
    var view: OperationsViewProtocol? { get set }
    var numberOfPending: Int { get }
    var numberOfFinished: Int { get }
}

protocol OperationsRouterProtocol {
    func navigateToQuestionVC(delegate: OperationQuestionsProtocol)
    func navigateToFinishedVC(finished: [Question])
}

protocol OperationsOutputInteractor {
    func didFinishWaitTime(operation: Question)
}

protocol OperationsInputInteractor {
    func addOperationToQueue(operation: Question)
}

protocol OperationsCellView {
    func configurePending(model: Question)
    func configureFinished(model: Question)
}

protocol OperationQuestionsProtocol {
    func didAddNewQuestion(question: Question)
}
