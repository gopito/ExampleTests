//
//  Hater.swift
//  Example
//
//  Created by a.smolianin on 16.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
