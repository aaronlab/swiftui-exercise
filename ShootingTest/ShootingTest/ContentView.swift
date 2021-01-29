//
//  ContentView.swift
//  ShootingTest
//
//  Created by Aaron Lee on 2021/01/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            MainView()
        } //: Z
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
