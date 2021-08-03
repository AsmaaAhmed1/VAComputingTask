//
//  WelcomePresenter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class WelcomePresenter: WelcomePresenterProtocol {
    weak var view: WelcomeViewProtocol?
    private let router: WelcomeRouterProtocol
    
    init(view: WelcomeViewProtocol, router: WelcomeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func navigateToOperations() {
        router.navigateToOperationsVC()
    }
    
    func navigateToMyLocation() {
        router.navigateToMyLocationVC()
    }
}
