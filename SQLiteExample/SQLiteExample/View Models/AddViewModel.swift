//
//  AddViewModel.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import Foundation

final class AddViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobileNo: String = ""
    
}
