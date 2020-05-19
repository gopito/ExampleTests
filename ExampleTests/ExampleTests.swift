//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by a.smolianin on 16.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import XCTest
//импорт модуля для тестов
@testable import Example

class ExampleTests: XCTestCase {
    
    override class func setUp() {
            print("In class setUp.")
        }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //проверка инициализации Hater
    func testHaterStartsNicely() {
        let hater = Hater()
        
        XCTAssertFalse(hater.hating)
    }
    
    //проверка хейта после плохого дня
    func testHaterHatesAfterBadDay() {
        // Given
        var hater = Hater()
        
        // When
        hater.hadABadDay()
        
        // Then
        XCTAssertTrue(hater.hating)
    }
    
    //проверка отсутствия хейта после хорошего дня
    func testHaterHappyAfterGoodDay() {
        var hater = Hater()
        
        hater.hadAGoodDay()
        
        XCTAssertFalse(hater.hating)
    }


}
