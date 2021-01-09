//
//  ContentView.swift
//  Shared
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
            .preferredColorScheme(.light)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
