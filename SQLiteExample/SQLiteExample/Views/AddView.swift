//
//  AddView.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct AddView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var mobileNo: String = ""
    
    var body: some View {
        VStack {
            
            self.makeRow(fieldName: "Name: ", self.$name)
            self.makeRow(fieldName: "Email: ", self.$email)
            self.makeRow(fieldName: "Mobile: ", self.$mobileNo)
            
        } //: V
        .padding()
    }
    
    private func makeRow(fieldName: String, _ text: Binding<String>, keyboardType: UIKeyboardType = .default, contentType: UITextContentType? = .none) -> some View {
        return HStack {
            
            Text(fieldName)
                .fontWeight(.bold)
            
            TextField("", text: text)
                .keyboardType(keyboardType)
                .textContentType(contentType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } //: H
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
