//
//  Counter.swift
//  MVVMExample
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

struct Counter {
    
    var value: Int = 0
    
    mutating func increment() {
        self.value += 1
    }
    
}
