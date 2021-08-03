//
//  QuestionPresenter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class QuestionPresenter: QuestionPresenterProtocol {
    weak var view: QuestionViewProtocol?
    private let router: QuestionRouterProtocol
    private let delegate: OperationQuestionsProtocol?
    private var question: Operation?
    var numbersArray: [Int] = []
    var mathematicalOperation: (Double,Double)->Double = (+)
    
    init(view: QuestionViewProtocol, router: QuestionRouterProtocol, delegate: OperationQuestionsProtocol) {
        self.view = view
        self.router = router
        self.delegate = delegate
    }
    
    func addedNewNumber(number: Int) {
        numbersArray.append(number)
        if numbersArray.count > 1 {
            view?.doneBtnEnabled()
        }
    }
    
    /// choose the operation based on the button's pressed tag
    /// - Parameter senderTag: the button's tag
    func chooseOperation(senderTag: Int) {
        switch senderTag {
        case 0:
            mathematicalOperation = (+)
        case 1:
            mathematicalOperation = (-)
        case 2:
            mathematicalOperation = (*)
        case 3:
            mathematicalOperation = (/)
           
        default:
            print()
        }
    }
    
    /// create question object and send it to the pendings view to be added to the queue
    /// - Parameter waitTime: the time the operations waits in the background service to be excuted
    func addQuestion(waitTime: Int) {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .second, value: waitTime, to: Date()) ?? Date()
        let id = Int.random(in: 1..<100)
        let operation = Question(id: id, numbers: numbersArray, date: date, op: mathematicalOperation)
        delegate?.didAddNewQuestion(question: operation)
        navigateToOperationsVC()
    }
    
    func navigateToOperationsVC() {
        router.navigateToOperationsVC()
    }
    
}
