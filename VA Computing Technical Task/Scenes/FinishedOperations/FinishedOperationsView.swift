//
//  FinishedOperationsView.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
protocol FinishedOperationsViewProtocol: class {
    var presenter: FinishedOperationsPresenter! {get set}
    func hideTableView()
    func showTableView()
    func reloadData()
}

protocol FinishedOperationsPresenterProtocol: class {
    var view: FinishedOperationsViewProtocol? { get set }
    var numberFinished: Int { get }
}

protocol FinishedOperationsRouterProtocol {
    func dismiss()
}

protocol FinishedOperationsCellView {
    func configureFinished(model: Question)
}

protocol FinishedOperationQuestionsProtocol {
    func didAddNewQuestion(question: Question)
}
