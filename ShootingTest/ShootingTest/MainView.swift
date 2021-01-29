//
//  MainView.swift
//  ShootingTest
//
//  Created by Aaron Lee on 2021/01/29.
//

import SwiftUI

struct MainView: View {
    
    @State private var isAnimating = false
    @State private var offset: CGFloat = 0
    @State private var speed: Double = 3
    
    private var foreverAnimation: Animation {
        Animation
            .linear(duration: self.speed)
            .repeatForever()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                VStack {
                    
                    ForEach(0..<5) { index in
                        
                        HStack {
                            
                            ForEach(0..<10) { index in
                                Rectangle()
                                    .frame(width: geo.size.width / 20, height: geo.size.width / 20)
                                    .foregroundColor(.yellow)
                                
                                if index != 9 {
                                    Spacer(minLength: 0)
                                }
                            }
                            
                        } //: H
                        .padding(.horizontal, 16)
                    }
                } //: V
                .offset(x: 0, y: self.isAnimating ? geo.size.height : 0)
                .animation(foreverAnimation)
                .onAppear {
                    self.isAnimating = true
                }
                
            } //: Z
        } //: G
    }
}
