//
//  ContentView.swift
//  SomeExamples
//
//  Created by Aaron Lee on 2020-10-27.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName: String = ""
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            
            TextField("User Name", text: $userName)
            Text(userName)
            
            Toggle(isOn: $isOn, label: {
                Text("Wifi")
            })
            Image(systemName: isOn ? "wifi" : "wifi.slash")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
