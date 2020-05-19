//
//  MusicTest.swift
//  ExampleTests
//
//  Created by a.smolianin on 19.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import XCTest
@testable import Example

class MusicTest: XCTestCase {

    func testFetch() {
        //if failed we get error message in debug
        let exp = expectation(description: "server fetch")
        
        let music = Music()
        
        music.fetchMusic { (items, error) in
            XCTAssertNotNil(items, "items should not be nil")
            XCTAssertTrue(items!.count > 0, "items should not be empty")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 0.000001) { (error) in
            print (error?.localizedDescription)
        }
    }
}
