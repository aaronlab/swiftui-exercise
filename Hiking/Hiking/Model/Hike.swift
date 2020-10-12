//
//  Hike.swift
//  Hiking
//
//  Created by Aaron Lee on 2020-10-12.
//

import Foundation

struct Hike {
    
    let name: String
    let imageURL: String
    let miles: Double
    
}

extension Hike {
    
    static func all() -> [Hike] {
        
        return [
            Hike(name: "Something1", imageURL: "something1", miles: 6),
            Hike(name: "Something2", imageURL: "something2", miles: 6.8),
            Hike(name: "Something3", imageURL: "something3", miles: 5)
        ]
        
    }
    
}
