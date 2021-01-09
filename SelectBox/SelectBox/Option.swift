//
//  Option.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import Foundation

struct Option {
    let title: String
}

extension Option: Identifiable {
    var id: UUID { UUID() }
}

extension Option {
    
    static func placeHolder() -> [Option] {
        var list = [Option]()
        
        for i in 1...30 {
            list.append(Option(title: "Option \(i)"))
        }
        
        return list
    }
    
}
