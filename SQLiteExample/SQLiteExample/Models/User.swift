//
//  User.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import Foundation

struct User {
    let name: String
    let email: String
    let mobileNo: String
}

extension User: Identifiable {
    
    var id: UUID { UUID() }
    
}
