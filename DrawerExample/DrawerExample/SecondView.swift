//
//  SecondView.swift
//  DrawerExample
//
//  Created by Aaron Lee on 2020-12-15.
//

import SwiftUI

struct SecondView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                Text("Second View")
            } //: Z
            .frame(width: geo.size.width, height: geo.size.height)
        } //: G
        .navigationBarTitle("The Second View")
    }
    
}
