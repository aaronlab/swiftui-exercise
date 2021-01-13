//
//  ContentView.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import SwiftUI

struct ContentView: View {
    
    @MyNumber private var myNumber: Double = 0.1
    
    var body: some View {
        VStack {
            Text("\(self.myNumber)")
            
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
