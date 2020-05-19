//
//  MusicTests.swift
//  MyAppTests
//
//  Created by Bear Cahill on 3/26/18.
//  Copyright © 2018 Bear Cahill. All rights reserved.
//

import XCTest
@testable import Example

class MusicTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        let music = Music()
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let result = music.parseJSON(data: data)
                XCTAssertNotNil(result!, "should not be nil")
                XCTAssertGreaterThan(result!.count, 0, "should have values")
            }
            else {
                XCTFail()
            }
        }
        else {
            XCTFail()
        }
    }
    
    func testRefresh() {
        let music = MockMusic()
        music.refresh()
        XCTAssertNotNil(music.cache, "the cache should not be nil")
    }
    
    func testFetch() {
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
