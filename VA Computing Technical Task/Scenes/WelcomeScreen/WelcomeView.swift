//
//  WelcomeView.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
protocol WelcomeViewProtocol: class {
    var presenter: WelcomePresenter! {get set}
}

protocol WelcomePresenterProtocol: class {
    var view: WelcomeViewProtocol? { get set }
}

protocol WelcomeRouterProtocol {
    func navigateToOperationsVC()
    func navigateToMyLocationVC()
}
