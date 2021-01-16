//
//  ContentView.swift
//  AlertTextField
//
//  Created by Aaron Lee on 2021/01/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var text = ""
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(action: {
                    self.showAlert.toggle()
                }, label: {
                    Text("Show Alert")
                })
                
                Text(self.text)
            }
            
            if self.showAlert {
                AlertView(text: self.$text, showAlert: self.$showAlert, title: "Put something", message: "Alert + TextField")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
