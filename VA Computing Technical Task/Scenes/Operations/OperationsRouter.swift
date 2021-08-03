//
//  OperationsRouter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class OperationsRouter: OperationsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    class func createView() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(OperationsViewController.self)") as! OperationsViewController
        let router = OperationsRouter()
        let interactor = OperationsInteractor()
        let presenter = OperationsPresenter(view: view as OperationsViewProtocol, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToQuestionVC(delegate: OperationQuestionsProtocol) {
        let questionVC = QuestionRouter.createView(delegate: delegate)
        questionVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(questionVC, animated: true)
        
    }
    
    func navigateToFinishedVC(finished: [Question]) {
        let finishedVC = FinishedOperationsRouter.createView(finished: finished)
        finishedVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(finishedVC, animated: true)
    }
}
