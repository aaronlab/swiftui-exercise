//
//  Dish.swift
//  Grid-Demo
//
//  Created by Aaron Lee on 2020-10-13.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    
    let id = UUID()
    let name: String
    let price: Double
    let imageURL: String
    
}

extension Dish {
    
    static func all() -> [Dish] {
        
        return [
            Dish(name: "Something 1", price: 35, imageURL: "e1"),
            Dish(name: "Something 2", price: 10, imageURL: "e2"),
            Dish(name: "Something 3", price: 12, imageURL: "e2"),
            Dish(name: "Something 4", price: 15, imageURL: "a1"),
            Dish(name: "Something 5", price: 8, imageURL: "d1"),
            Dish(name: "Something 6", price: 19, imageURL: "d2"),
            Dish(name: "Something 7", price: 32, imageURL: "e2")
        ]
        
    }
    
}
