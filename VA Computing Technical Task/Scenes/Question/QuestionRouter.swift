//
//  QuestionRouter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class QuestionRouter: QuestionRouterProtocol {
    
    weak var viewController: UIViewController?
    
    class func createView(delegate: OperationQuestionsProtocol) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(QuestionViewController.self)") as! QuestionViewController
        let router = QuestionRouter()
        let presenter = QuestionPresenter(view: view as QuestionViewProtocol, router: router, delegate: delegate)
        view.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToOperationsVC() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
}
