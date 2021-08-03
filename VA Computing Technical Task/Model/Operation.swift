//
//  Operation.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class Question {
    var id: Int
    var numbers: [Int]
    var result: Double?
    var date: Date
    var op: (Double,Double)->Double
    
    init(id: Int, numbers: [Int], date: Date, op: @escaping (Double,Double)->Double) {
        self.id = id
        self.numbers = numbers
        self.date = date
        self.op = op
    }
}
