//
//  OperationTableViewCell.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class OperationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var operationText: UILabel!
    @IBOutlet weak var operationTime: UILabel!
    @IBOutlet weak var operationNumber: UILabel!
    @IBOutlet weak var operationResult: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configurePending(operation: Question) {
        operationText.text = operation.numbers.map { String($0) }.joined(separator: ", ")
        operationTime.text = "\(operation.date)"
        operationNumber.text = "\(operation.id)"
    }
    
    func configureFinished(operation: Question) {
        operationText.text = operation.numbers.map { String($0) }.joined(separator: ", ")
        operationTime.isHidden = true
        operationResult.isHidden = false
        operationResult.text = "Result = \(operation.result ?? 0)"
        operationNumber.text = "\(operation.id)"
    }

}
