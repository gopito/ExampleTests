//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by a.smolianin on 19.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import XCTest

class ExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        let myLabel = app.staticTexts["myLabel"]
        let textView = app.otherElements.textFields["TextView"]
        textView.tap()
        textView.typeText("123")
        
        app.buttons["Calc"].tap()
        XCTAssertTrue(myLabel.label.hasPrefix("tip"), "tip is missing")
//        print(app.debugDescription)

    }

}
