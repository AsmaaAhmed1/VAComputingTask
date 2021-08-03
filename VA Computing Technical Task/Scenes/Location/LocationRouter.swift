//
//  LocationRouter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class LocationRouter: LocationRouterProtocol {

    weak var viewController: UIViewController?

    class func createView() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(LocationViewController.self)") as! LocationViewController
        let router = LocationRouter()
        let presenter = LocationPresenter(view: view as LocationViewProtocol, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
    
    func dismiss() {
        
    }
    
}
