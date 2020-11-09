//
//  Slider1.swift
//  CustomSlider
//
//  Created by Aaron Lee on 2020-11-09.
//

import SwiftUI

struct Slider: View {
    // MARK: - PROPERTIES
    
    @Binding var percentage: Float
    let action: () -> Void
    
    // MARK: - BODY
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                // OUTER
                Rectangle()
                    .foregroundColor(.white)
                
                // INNER
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
                    ) //: INNER
            } //: ZSTACK
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke()
            )
            .cornerRadius(16)
            .frame(height: 50)
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            if value.translation.width > 0 {
                                // START INCREASEING
                                DispatchQueue.main.async {
                                    withAnimation(.linear) {
                                        self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                                    }
                                }
                            }
                        }) //: ONCHANGED
                        .onEnded({ value in
                                if self.percentage >= 60 && self.percentage < 100 {
                                    // INCREASED
                                    DispatchQueue.main.async {
                                        withAnimation(.easeInOut(duration: 0.4)) {
                                            self.percentage = 100
                                        }
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        action()
                                        self.percentage = 30
                                    }
                                } else {
                                    // DECREASED
                                    DispatchQueue.main.async {
                                        withAnimation(.easeInOut) {
                                            self.percentage = 30
                                        }
                                    }
                                }
                        }) //: ONENDED
            ) //: GESTURE
        } //: GEOMETRY
        
    }
    
}
