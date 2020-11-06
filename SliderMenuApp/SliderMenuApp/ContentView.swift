//
//  ContentView.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var showMenu = false
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(showMenu: $showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: showMenu ? geometry.size.width / 2 : 0)
                    .disabled(showMenu)
                
                if showMenu {
                    MenuView()
                        .frame(width: geometry.size.width / 2)
                        .transition(.move(edge: .leading))
                }
            }
        } //: GEOMETRY
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
