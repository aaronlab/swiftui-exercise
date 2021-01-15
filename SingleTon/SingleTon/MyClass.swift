//
//  MyClass.swift
//  SingleTon
//
//  Created by Aaron Lee on 2021/01/15.
//

import Foundation

final class MyClass {
    
    static let shared = MyClass()
    
    private init() {}
    
    var value = 0
    
}
