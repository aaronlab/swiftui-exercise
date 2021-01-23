//
//  ContentView.swift
//  MultiLineTextField
//
//  Created by Aaron Lee on 2021/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            
            TextView(text: $text)
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
