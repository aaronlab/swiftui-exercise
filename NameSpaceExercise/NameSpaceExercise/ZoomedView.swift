//
//  ZoomedView.swift
//  NameSpaceExercise
//
//  Created by Aaron Lee on 2021/01/11.
//

import SwiftUI

struct ZoomedView: View {
    
    let rect: Rect
    @Binding var zoomRect: Bool
    var animation: Namespace.ID
    
    var color: Color {
        switch self.rect {
        case .first:
            return .red
        case .second:
            return .green
        case .third:
            return .blue
        }
    }
    
    init(rect: Rect, zoomRect: Binding<Bool>, animation: Namespace.ID) {
        self.rect = rect
        self._zoomRect = zoomRect
        self.animation = animation
    }
    
    var body: some View {
        
        ZStack {
            
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .matchedGeometryEffect(id: self.rect, in: self.animation)
                .foregroundColor(self.color)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    withAnimation {
                        self.zoomRect.toggle()
                    }
                }
            
        } //: Z
    }
    
}
