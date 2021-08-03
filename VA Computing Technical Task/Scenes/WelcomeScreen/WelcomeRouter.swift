//
//  WelcomeRouter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class WelcomeRouter: WelcomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    class func createView() -> UIViewController {
        let navBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"NavBar") as! UINavigationController
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(WelcomeViewController.self)") as! WelcomeViewController
        navBar.viewControllers = [view]
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(view: view as WelcomeViewProtocol, router: router)
        view.presenter = presenter
        router.viewController = view
        return navBar
    }
    
    func navigateToOperationsVC() {
        let operationsvc = OperationsRouter.createView()
        operationsvc.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(operationsvc, animated: true)
    }
    
    func navigateToMyLocationVC() {
        let locationvc = LocationRouter.createView()
        locationvc.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(locationvc, animated: true)
    }
}

