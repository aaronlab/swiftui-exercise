//
//  ContentView.swift
//  CustomTextField
//
//  Created by Aaron Lee on 2020-11-25.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        CustomTextField(text: $text, isFirstResponder: true, placeholder: "Something")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
