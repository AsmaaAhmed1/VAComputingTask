//
//  QuestionViewController.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, QuestionViewProtocol {
    
    @IBOutlet weak var parametersStack: UIStackView!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var operationStack: UIStackView!
    
    @IBOutlet weak var anotherNumberBtn: RedRoundedButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet var operations: [UIButton]!
    @IBOutlet weak var waitTime: UITextField!
    @IBOutlet weak var calculateBtn: RedRoundedButton!
    
    var presenter: QuestionPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupField() {
        numberField.delegate = self
    }
    
    @IBAction func enterAnotherNumber(_ sender: Any) {
        guard let number = Int(numberField.text ?? "") else {return}
        presenter?.addedNewNumber(number: number)
        numberField.text = ""
    }
    
    @IBAction func done(_ sender: Any) {
        updateStacksVisibility()
    }
    
    @IBAction func selectOperation(_ sender: UIButton) {
        presenter?.chooseOperation(senderTag: sender.tag)
        updateOperationBtnUI(senderTag: sender.tag)
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        guard let wait = Int(waitTime.text ?? "") else { return }
        presenter?.addQuestion(waitTime: wait)
    }
    
    func doneBtnEnabled() {
        doneBtn.isEnabled = true
        doneBtn.isUserInteractionEnabled = true
    }
    
    func updateOperationBtnUI(senderTag: Int) {
        for button in operations {
            if button.tag == senderTag {
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.red.cgColor
            }else {
                button.layer.borderColor = UIColor.white.cgColor
            }
            
        }
    }
    
    func updateStacksVisibility() {
        parametersStack.isHidden = true
        operationStack.isHidden = false
    }
}

extension QuestionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 0 || !(textField.text?.isEmpty ?? false) {
            anotherNumberBtn.isUserInteractionEnabled = true
        }else {
            anotherNumberBtn.isUserInteractionEnabled = false
        }
        
        return true
    }
}
