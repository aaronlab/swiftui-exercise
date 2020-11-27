//
//  ContentView.swift
//  WrappableTextField
//
//  Created by Aaron Lee on 2020-11-27.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            HStack {
                Text("User Name: ")
                Text(userName)
                Spacer()
            }
            
            HStack {
                Text("Password: ")
                Text(password)
                Spacer()
            }
            
            CustomTextField(tag: 0, placeholder: "User Name") { value in
                self.userName = value
            } onCommitted: {
                print("onCommitted")
            }
            .customKeyboardType(.emailAddress)
            .customContentType(.emailAddress)
            .customCapitalization(.none)
            
            CustomTextField(tag: 1, placeholder: "Password") { value in
                self.password = value
            } onCommitted: {
                print("onCommitted")
            }
            .secureType()

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
