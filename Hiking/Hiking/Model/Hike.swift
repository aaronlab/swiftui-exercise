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
            Hike(name: "Hiking1", imageURL: "something1", miles: 6),
            Hike(name: "Hiking2", imageURL: "something2", miles: 6.8),
            Hike(name: "Hiking3", imageURL: "something3", miles: 5)
        ]
        
    }
    
}
