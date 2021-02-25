//
//  Source.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import Foundation

struct Source: Decodable {
    
    let id: String?
    
    let name: String?
    
}

extension Source: Hashable {
    
    static func == (lhs: Source, rhs: Source) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
    
}
