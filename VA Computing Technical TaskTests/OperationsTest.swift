//
//  VA_Computing_Technical_TaskTests.swift
//  VA Computing Technical TaskTests
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import XCTest
@testable import VA_Computing_Technical_Task

class OperationsTest: XCTestCase {
    
    var operationsPresenter: OperationsPresenter!
    
    override func setUp() {
        operationsPresenter = OperationsPresenter(view: nil, router: nil)
        
    }
    
    func testOperation() {
        do {
            let result = operationsPresenter.excuteOperation(numbers: [1,2,3], mathOp: (+))
            XCTAssertEqual(result, 6)
        }
    }

}
