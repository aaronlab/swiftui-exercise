//
//  ContentView.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-12-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Hello")
        }
        .navigationBarTitle("Hacker News")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
