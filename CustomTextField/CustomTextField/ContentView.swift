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
            .customForegroundColor(.orange)
            .customFont(.systemFont(ofSize: 16, weight: .light))
            .defaultBorder(borderColor: .white)
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 52)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
