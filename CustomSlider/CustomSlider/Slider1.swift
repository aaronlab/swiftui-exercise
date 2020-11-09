//
//  Slider1.swift
//  CustomSlider
//
//  Created by Aaron Lee on 2020-11-09.
//

import SwiftUI

struct Slider: View {
    
    @Binding var percentage: Float
    let action: () -> Void
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                // OUTER RECTANGLE
                Rectangle()
                    .foregroundColor(.white)
                
                // INNER RECTANGLE
                Rectangle().foregroundColor(.gray)
                    .frame(width: geometry.size.width * CGFloat(percentage / 100))
                    .overlay(
                        HStack {
                            if percentage > 40 {
                                Text("Slide to Unlock")
                                    .foregroundColor(.white)
                                    .animation(.easeIn)
                            }
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .frame(alignment: .leading)
                                .animation(.easeIn)
                        }
                    ) //: INNER RECTANGLE
            } //: ZSTACK
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke()
            )
            .cornerRadius(16)
            .frame(height: 50)
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            if value.translation.width > 0 {
                                DispatchQueue.main.async {
                                    withAnimation(.linear) {
                                        self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                                    }
                                }
                            }
                        }) //: ONCHANGED
                        .onEnded({ value in
                            DispatchQueue.main.async {
                                if self.percentage >= 60 && self.percentage < 100 {
                                    withAnimation(.easeInOut) {
                                        self.percentage = 100
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            withAnimation(.linear) {
                                                self.percentage = 30
                                            }
                                        }
                                    }
                                    action()
                                } else {
                                    withAnimation(.easeInOut) {
                                        self.percentage = 30
                                    }
                                }
                            }
                        }) //: ONENDED
            )
        } //: GEOMETRY
        
    }
    
}
