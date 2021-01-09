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
            Hike(name: "Toronto", imageURL: "toronto", miles: 6),
            Hike(name: "Toronto Island", imageURL: "toronto_island", miles: 6.8),
            Hike(name: "CN Tower", imageURL: "cn_tower", miles: 5)
        ]
        
    }
    
}
