//
//  ViewModel.swift
//  MVVMTestExample
//
//  Created by Aaron Lee on 2021/01/23.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var isLoading = false
    
    func getUser() {
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let user = User.init(userName: "jungbin", email: "binbin@bin.bin")
            self.user = user
            self.isLoading = false
        }
    }
    
}
