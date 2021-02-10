//
//  ContentView.swift
//  ViewBuilderTest
//
//  Created by Aaron Lee on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            makeText("Function with return")
            
            makeTextWithViewBuilder("ViewBuilder Function without return")
        }
    }
    
    func makeText(_ text: String) -> some View {
        return Text(text)
            .foregroundColor(.red)
    }
    
    @ViewBuilder
    func makeTextWithViewBuilder(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.blue)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
