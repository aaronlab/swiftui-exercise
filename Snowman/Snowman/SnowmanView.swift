//
//  SnowmanView.swift
//  Snowman
//
//  Created by Aaron Lee on 2021/01/12.
//

import SwiftUI

struct SnowmanView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            self.makeHead()
            
            self.makeBody()
                .frame(width: self.screenWidth, height: self.screenWidth)
            
        } //: V
        .frame(width: self.screenWidth, height: self.screenHeight)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
}

extension SnowmanView {
    
    /// HEAD
    private func makeHead() -> some View {
        return ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: self.screenWidth / 2, height: self.screenWidth / 2)
            
            VStack {
                Spacer()
                HStack {
                    Rectangle()
                        .frame(width: self.screenWidth / 6, height: 10)
                        .rotationEffect(.init(degrees: -10))
                    
                    Spacer(minLength: 30)
                    
                    Rectangle()
                        .frame(width: self.screenWidth / 6, height: 10)
                        .rotationEffect(.init(degrees: 10))
                }
                
                Spacer(minLength: 30)
                
                Circle()
                    .frame(width: 20)
            }
            .padding()
            .frame(width: self.screenWidth / 4, height: self.screenWidth / 3)
        }
    }
    
    /// BODY
    private func makeBody() -> some View {
        return Circle()
            .foregroundColor(.white)
    }
    
}
