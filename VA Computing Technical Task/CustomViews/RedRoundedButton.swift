//
//  RedRoundedButton.swift
//  VA Computing Technical Task
//
//  Created by user200143 on 8/3/21.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class RedRoundedButton: UIButton {
    @IBInspectable var background: UIColor? =  #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1) {
        didSet {
           backgroundColor = background
        }
    }
    
    @IBInspectable var corners: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = corners
        }
    }
}
