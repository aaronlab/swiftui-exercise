//
//  ContentView.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            PageOne()
            
            PageTwo()
            
            PageThree()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
