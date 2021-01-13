//
//  UserInfo.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import Foundation

@propertyWrapper
struct UserInfo {
    private let key: String
    
    var wrappedValue: String {
        get { UserDefaults.standard.string(forKey: key) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
    
    init(key: String) {
        self.key = key
    }
}
