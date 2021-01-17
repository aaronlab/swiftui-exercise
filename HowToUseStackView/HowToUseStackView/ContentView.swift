//
//  ContentView.swift
//  HowToUseStackView
//
//  Created by Aaron Lee on 2021/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {

                NavigationLink(destination: VStackView()) {
                    Text("VStack")
                }

                NavigationLink(destination: HStackView()) {
                    Text("HStack")
                }

                NavigationLink(destination: ZStackView()) {
                    Text("ZStack")
                }
            } //: V
            .navigationBarTitle("How to Use StackViews")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
