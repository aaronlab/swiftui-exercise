//
//  MyNumber.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import Foundation

@propertyWrapper
struct MyNumber {
    private var number: Double = 0.0
    
    var wrappedValue: Double {
        get { number }
        set { number = newValue * 10 }
    }
    
    init(wrappedValue: Double) {
        self.wrappedValue = wrappedValue
    }
}
