//
//  MusicPerf.swift
//  ExampleTests
//
//  Created by a.smolianin on 19.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import XCTest
@testable import Example
class MusicPerf: XCTestCase {



    func testMusic()  {
        // This is an example of a performance test case.
//        self.measure {
//            let music = MockMusic()
//            music.fetchMusic { (items, error) in
//                
//            }
//        }
        self.measure {
            let exp = expectation(description: "server fetch")
            let music = Music()
            music.fetchMusic { (items, error) in
                exp.fulfill()
            }
            waitForExpectations(timeout: 10.0) { (error) in
                print(error?.localizedDescription)
            }
        }
    }
    

    

}
