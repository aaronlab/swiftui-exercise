//
//  Dishes.swift
//  Hello-Binding
//
//  Created by Aaron Lee on 2020-10-14.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool
    
}

extension Dish {
    
    static func all() -> [Dish] {
        
        return [
            
            Dish(name: "Something1", imageURL: "something1", isSpicy: true),
            Dish(name: "Something2", imageURL: "something2", isSpicy: false),
            Dish(name: "Something3", imageURL: "something3", isSpicy: true)
            
        ]
        
    }
    
}
