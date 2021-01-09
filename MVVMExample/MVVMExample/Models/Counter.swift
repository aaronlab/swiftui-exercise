//
//  Counter.swift
//  MVVMExample
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

struct Counter {
    
    var value: Int = 0
    var isPremium: Bool = false
    
    mutating func increment() {
        self.value += 1
        
        if value.isMultiple(of: 3) {
            // premium
            isPremium = true
        } else {
            // not premium
            isPremium = false
        }
    }
    
}
