//
//  ContentView.swift
//  HelloState
//
//  Created by Aaron Lee on 2020-10-14.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "John"
    
    var body: some View {
        VStack {
            
            Text(name)
                .font(.largeTitle)
            
            Button(action: {
                self.name = "Aaron"
            }) {
                Text("Change Name")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
