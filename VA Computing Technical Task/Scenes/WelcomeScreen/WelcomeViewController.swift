//
//  WelcomeViewController.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, WelcomeViewProtocol {
    
    var presenter: WelcomePresenter!
    

    @IBOutlet weak var goMathematicsBtn: RedRoundedButton!
    @IBOutlet weak var myLocationBtn: RedRoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func navigateToMathematics(_ sender: UIButton) {
        presenter.navigateToOperations()
    }
    
    @IBAction func navigateToMyLocation(_ sender: UIButton) {
        presenter.navigateToMyLocation()
    }
}
