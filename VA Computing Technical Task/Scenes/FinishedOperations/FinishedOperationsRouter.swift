//
//  FinishedOperationsRouter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class FinishedOperationsRouter: FinishedOperationsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    class func createView(finished: [Question]) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(FinishedOperationsViewController.self)") as! FinishedOperationsViewController
        let router = FinishedOperationsRouter()
        let presenter = FinishedOperationsPresenter(view: view as FinishedOperationsViewProtocol, router: router, finished: finished)
        view.presenter = presenter
        router.viewController = view
        return view
    }
    
    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
