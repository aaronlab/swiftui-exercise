//
//  SQLiteService.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import Foundation
import SQLite

final class SQLiteService {
    
    /// DB Connection
    private static func getConnection() -> Connection? {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return try? Connection("\(path)/db.sqlite3")
    }
    
    /// Save User
    static func saveUser(with user: User, onSuccess: (() -> Void)? = nil, onFailure: ((Error?) -> Void)? = nil) {
        guard let db = self.getConnection()
        
        else {
            onFailure?(DBError.connectionError)
            return
        }
        
        let userTable = Table("users")
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let mobileNo = Expression<String>("mobileNo")
        
        do {
            // CREATE TABLE
            try db.run(userTable.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(name)
                table.column(email)
                table.column(mobileNo)
            })
            
            // INSERT ROW
            try db.run(userTable.insert(
                name <- user.name,
                email <- user.email,
                mobileNo <- user.mobileNo
            ))
            
            onSuccess?()
        } catch {
            onFailure?(error)
        }
    }
    
    // Get All Users
    static func readUsers(onSuccess: (([User]) -> Void)? = nil, onFailure: ((Error?) -> Void)? = nil) {
        guard let db = self.getConnection()
        
        else {
            onFailure?(DBError.connectionError)
            return
        }
        
        let userTable = Table("users")
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let mobileNo = Expression<String>("mobileNo")
        
        do {
            var users = [User]()
            for user in try db.prepare(userTable) {
                let userName = user[name]
                let userEmail = user[email]
                let userMobileNo = user[mobileNo]
                
                let loadedUser = User.init(name: userName, email: userEmail, mobileNo: userMobileNo)
                users.append(loadedUser)
            }
            onSuccess?(users)
        } catch {
            onFailure?(error)
        }
    }
    
}

enum DBError: Error {
    case connectionError
}
