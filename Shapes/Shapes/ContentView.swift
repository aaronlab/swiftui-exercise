//
//  ContentView.swift
//  Shapes
//
//  Created by Aaron Lee on 2020-12-20.
//

import SwiftUI

struct ContentView: View {
    @State private var isHappy: Bool = true
    
    var body: some View {
        
        VStack {
            
            Spacer(minLength: 0)
            
            HStack(spacing: 20) {
                
                ForEach(1...2, id: \.self) { _ in
                    ZStack {
                        Eyes()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                        
                        Eyes(value: isHappy ? 1.0 : 0.0)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                            .rotationEffect(.init(degrees: 180))
                            .offset(y: -100)
                        
                        Circle()
                            .fill(Color.black)
                            .frame(width: 13, height: 13)
                            .offset(y: -30)
                    }
                    .frame(height: 100)
                }
                
            }
            
            Smile(value: isHappy ? 1.0 : 0.0)
                .stroke(Color.black, lineWidth: 3)
                .frame(height: 150)
                .padding(.top, 40)
            
            Spacer(minLength: 0)
            
            Button {
                self.isHappy.toggle()
            } label: {
                Text("Toggle")
            }
            
            
        }
        .background(
            (isHappy ? Colors.color2 : Colors.color1)
                .ignoresSafeArea()
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
