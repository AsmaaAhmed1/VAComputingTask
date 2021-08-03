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
    var result: Int?
    var date: Date
    var op: (Int,Int)->Int
    
    init(id: Int, numbers: [Int], date: Date, op: @escaping (Int,Int)->Int) {
        self.id = id
        self.numbers = numbers
        self.date = date
        self.op = op
    }
}
