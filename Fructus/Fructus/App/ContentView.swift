//
//  ContentView.swift
//  Fructus
//
//  Created by Aaron Lee on 2020-11-01.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button(action: {
            isOnboarding = true
        }, label: {
            Text("isOnboarding = true")
                .foregroundColor(.blue)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
