//
//  ContentView.swift
//  TestPrj
//
//  Created by Aaron Lee on 2020-12-15.
//

import SwiftUI
import Drawer

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Drawer {
                Color.blue
            }
            .rest(at: .constant([100, 340]))
            .edgesIgnoringSafeArea(.vertical)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
