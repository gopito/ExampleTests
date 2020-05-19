//
//  MockMusic.swift
//  MyAppTests
//
//  Created by Bear Cahill on 3/26/18.
//  Copyright © 2018 Bear Cahill. All rights reserved.
//

import Foundation
@testable import Example

class MockMusic : Music {
    override func fetchMusic(completion: @escaping ([[String : Any]]?, Error?) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let parsedData = self.parseJSON(data: data)
                completion(parsedData, nil)
            }
        }
    }
}
