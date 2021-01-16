//
//  ContentView.swift
//  TestAppCode
//
//  Created by Aaron Lee on 2021/01/16.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {

            VStack(alignment: .center, spacing: 20) {

                NavigationLink(destination: TestView()) {
                    Text("Next View")
                }

                Text("Home View")

            }
        }
    }
}
