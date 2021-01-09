//
//  AddViewModel.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import Foundation
import SQLite

final class AddViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobileNo: String = ""
    
    func saveUser(onSuccess: (() -> Void)? = nil, onFailure: ((Error?) -> Void)?) {
        let user = User(name: self.name, email: self.email, mobileNo: self.mobileNo)
        SQLiteService.saveUser(with: user, onSuccess: onSuccess, onFailure: onFailure)
    }
    
}
