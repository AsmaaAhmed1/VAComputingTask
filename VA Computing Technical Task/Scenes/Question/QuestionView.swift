//
//  QuestionView.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
protocol QuestionViewProtocol: class {
    var presenter: QuestionPresenter? {get set}
    func doneBtnEnabled()
}

protocol QuestionPresenterProtocol: class {
    var view: QuestionViewProtocol? { get set }
}

protocol QuestionRouterProtocol {
    func navigateToOperationsVC()
}
