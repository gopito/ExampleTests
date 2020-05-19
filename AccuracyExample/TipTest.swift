//
//  TipTest.swift
//  ExampleTests
//
//  Created by a.smolianin on 18.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import XCTest
@testable import Example
class TipTest: XCTestCase {

    func tipTest() throws {
        let tc = TipCalc()
        let tip = tc.calcTip(amount: 128.51, tipPerc: 50)
//        XCTAssertEqual(64.26, tip, accuracy: 0.01, "Tip was wrong")
        XCTAssertEqual(64.26, tip, "Tip was wrong for 50%")
    }


}
