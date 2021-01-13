//
//  User.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import Foundation

struct User {
    @UserInfo(key: "userId") var userId: String
    @UserInfo(key: "name") var name: String
}
