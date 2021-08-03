//
//  VA_Computing_Technical_TaskUITests.swift
//  VA Computing Technical TaskUITests
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import XCTest

class VA_Computing_Technical_TaskUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Go Mathematics"].tap()
        app.buttons["+"].tap()
        app.textFields.element.tap()
        app.keys["1"].tap()
        app.buttons["Another Number"].tap()
        app.keys["2"].tap()
        app.buttons["Another Number"].tap()
        app.keys["3"].tap()
        app.buttons["Another Number"].tap()
        app.buttons["Choose The Operation"].tap()
        app.textFields.element.tap()
        app.keys["5"].tap()
        app.buttons["+"].tap()
        app.buttons["Calculate"].tap()
        
        XCTAssertNotNil(app.tables.cells.staticTexts["1, 2, 3"], "Cell must contains array of numbers")
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
