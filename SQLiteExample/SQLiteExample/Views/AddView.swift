//
//  AddView.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct AddView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel: AddViewModel
    
    // MARK: - INIT
    
    init() {
        self._viewModel = StateObject(wrappedValue: AddViewModel())
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            self.makeRow(fieldName: "Name: ", self.$viewModel.name)
            self.makeRow(fieldName: "Email: ", self.$viewModel.email)
            self.makeRow(fieldName: "Mobile: ", self.$viewModel.mobileNo)
            
        } //: V
        .padding()
        .navigationBarTitle("Add")
        .navigationBarItems(
            trailing: Button(
                action: {
                    self.save()
                },
                label: {
                    Text("Save")
                }
            ) //: B
            .disabled(
                self.viewModel.email == "" || self.viewModel.name == "" || self.viewModel.mobileNo == ""
            )
        )
    }
    
    // MARK: - METHODS
    
    /// Make a row for Add View
    private func makeRow(fieldName: String, _ text: Binding<String>, keyboardType: UIKeyboardType = .default, contentType: UITextContentType? = .none) -> some View {
        return HStack {
            
            Text(fieldName)
                .fontWeight(.bold)
            
            TextField("", text: text)
                .keyboardType(keyboardType)
                .textContentType(contentType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } //: H
    }
    
    /// Save Data
    private func save() {
        // TODO: SAVE
        self.viewModel.saveUser {
            self.presentationMode.wrappedValue.dismiss()
        } onFailure: { error in
            print(error as Any)
        }

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
