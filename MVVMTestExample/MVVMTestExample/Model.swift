//
//  Model.swift
//  MVVMTestExample
//
//  Created by Aaron Lee on 2021/01/23.
//

import Foundation

struct User: Codable {
    
    let userName: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case email = "email"
    }
    
}
