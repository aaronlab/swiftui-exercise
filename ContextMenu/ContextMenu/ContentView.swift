//
//  ContentView.swift
//  ContextMenu
//
//  Created by Aaron Lee on 2021-01-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.orange)
                    
                    Text("Context")
                } //: Z
                .padding()
                .frame(width: geo.size.width, height: geo.size.width)
                .modifier(Context())
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.red)
                    
                    Text("Context")
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.width)
                .modifier(Context())
                
                
            } //: V
            
        }
    }
}

struct Context: ViewModifier {
    func body(content: Content) -> some View {
        content
            .contextMenu(ContextMenu(menuItems: {
                
                ForEach(1...3, id: \.self) { index in
                    
                    Button(action: {
                        self.pressed(with: index)
                    }, label: {
                        Text("Menu \(index)")
                    })
                }
                
            }))
    }
    
    private func pressed(with menumNumber: Int) {
        print("Pressed Menu \(menumNumber) from Context")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
