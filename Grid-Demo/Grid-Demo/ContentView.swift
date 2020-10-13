//
//  ContentView.swift
//  Grid-Demo
//
//  Created by Aaron Lee on 2020-10-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        List {
            
            // rows
            ForEach(0..<5) {  _ in
                
                HStack {
                    
                    // columns
                    ForEach(0..<2) { _ in
                        
                        Image("e1")
                            .resizable()
                            .scaledToFit()
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
