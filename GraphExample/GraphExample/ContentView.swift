//
//  ContentView.swift
//  GraphExample
//
//  Created by Aaron Lee on 2020-12-16.
//

import SwiftUI

struct ContentView: View {
    
    let percentages = [20, 100, 50, 20, 30, 22, 88, 99, 11, 54]
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 16)
                    .fill()
                    .foregroundColor(.gray)
                    .border(Color.black, width: 1)
                    .shadow(color: Color.black.opacity(0.6), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.6), radius: 5, x: -5, y: -5)
                
                
            }
            .padding()
            .frame(width: geo.size.width, height: 200)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
