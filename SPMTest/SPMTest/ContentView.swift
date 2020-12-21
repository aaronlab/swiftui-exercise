//
//  ContentView.swift
//  SPMTest
//
//  Created by Aaron Lee on 2020-12-21.
//

import SwiftUI
import TestSPM

struct ContentView: View {
    var body: some View {
        VStack {
            TestSPM.TestView()
            TestView.TestView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
