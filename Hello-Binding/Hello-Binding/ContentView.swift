//
//  ContentView.swift
//  Hello-Binding
//
//  Created by Aaron Lee on 2020-10-14.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    
    private func printName() {
        print(self.name)
    }
    
    var body: some View {
        VStack {
            Text(name)
            TextField("Enter name", text: $name)
                .padding(12)
            
            Button(action: printName) {
                
                Text("Show Name Value")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
