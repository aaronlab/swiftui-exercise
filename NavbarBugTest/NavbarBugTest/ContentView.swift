//
//  ContentView.swift
//  NavbarBugTest
//
//  Created by Aaron Lee on 2021/01/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationLink("Child", destination: Child())
                
                Text("Parent")
                    .navigationBarTitle("Parent", displayMode: .inline)
            }
        }
    }
}

struct Child: View {
    var body: some View {
        
        Text("Child")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
