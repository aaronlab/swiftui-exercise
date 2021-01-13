//
//  ContentView.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myNumber: MyNumber = MyNumber(wrappedValue: 0.1)
    @State private var user: User = User()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("\(self.myNumber.wrappedValue)")
                
                Button(action: {
                    self.myNumber.wrappedValue += 0.1
                    self.user.name = "Aaron"
                    self.user.userId = "aaron\(Int(myNumber.wrappedValue))"
                }, label: {
                    Text("Button")
                })
                
                NavigationLink(destination: ChildView()) {
                    Text("Child View")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
