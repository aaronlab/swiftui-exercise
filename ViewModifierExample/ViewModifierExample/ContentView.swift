//
//  ContentView.swift
//  ViewModifierExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .modifier(TextModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
