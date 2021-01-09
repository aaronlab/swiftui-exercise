//
//  ContentView.swift
//  Custom-NavigationBar
//
//  Created by Aaron Lee on 2020-10-29.
//

import SwiftUI

struct ContentView: View {
    
    @State var navBarColor: UIColor = .green
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in

                VStack(spacing: 30) {
                    NavigationLink(destination: SecondView()) {
                        Text("Second View")
                    }
                    
                    Button(action: {
                        self.navBarColor = .gray
                    }, label: {
                        Text("Change to Gray")
                    })
                    
                    Button(action: {
                        self.navBarColor = .green
                    }, label: {
                        Text("Back to Green")
                    })
                    
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)

            }
                .navigationBarTitle("First View", displayMode: .inline)
                .navigationBarColor(navBarColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
