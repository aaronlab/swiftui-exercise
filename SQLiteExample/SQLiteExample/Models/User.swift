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

extension User {
    
    static func placeholder() -> [User] {
        return [
            User.init(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "1"),
            User.init(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "2"),
            User.init(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "3"),
            User.init(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "4"),
            User.init(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "5")
        ]
    }
    
}

extension User: Identifiable {
    
    var id: UUID { UUID() }
    
}
