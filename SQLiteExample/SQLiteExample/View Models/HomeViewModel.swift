//
//  HomeViewModel.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    func loadUsers() {
        SQLiteService.readUsers { users in
            self.users = users
        } onFailure: { error in
            print(error as Any)
        }
    }
    
}
