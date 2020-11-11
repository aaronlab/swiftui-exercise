//
//  ContentView.swift
//  OneLineLoadingBar
//
//  Created by Aaron Lee on 2020-11-11.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var barXPosition: CGFloat = 0
    
    var repeatingAnimation: Animation {
            Animation
                .linear(duration: 1)
                .repeatForever()
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Spacer()
                    
                    Text("Loading...")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    
                    // LOADING BAR
                    ZStack(alignment: .leading) {
                        
                        // BACKGROUND
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray)
                            .frame(height: 20)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                            .frame(width: geometry.size.width / 10)
                            .frame(height: 20)
                            .offset(x: barXPosition)
                            .onAppear {
                                
                                withAnimation(self.repeatingAnimation) {
                                    barXPosition = geometry.size.width - 32 - (geometry.size.width / 10)
                                }
                                
                            }
                        
                    } //: LOADING BAR
                    .padding(16)
                    .frame(width: geometry.size.width, height: 10)
                    
                    Spacer()
                    
                } //: VSTACK
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        } //: GEOMETRY
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
