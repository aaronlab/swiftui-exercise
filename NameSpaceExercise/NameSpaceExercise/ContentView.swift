//
//  ContentView.swift
//  NameSpaceExercise
//
//  Created by Aaron Lee on 2021/01/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rect: Rect = .first
    @State private var zoomRect: Bool = false
    @Namespace var animation
    
    var body: some View {
        ZStack {
            
            HStack {
                if !self.zoomRect {
                    
                    Rectangle()
                        .matchedGeometryEffect(id: Rect.first, in: self.animation)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation {
                                self.rect = .first
                                self.zoomRect.toggle()
                            }
                        }
                    
                    Rectangle()
                        .matchedGeometryEffect(id: Rect.second, in: self.animation)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation {
                                self.rect = .second
                                self.zoomRect.toggle()
                            }
                        }
                    
                    Rectangle()
                        .matchedGeometryEffect(id: Rect.third, in: self.animation)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation {
                                self.rect = .third
                                self.zoomRect.toggle()
                            }
                        }
                }
                
            } //: H
            
            if self.zoomRect {
                
                ZoomedView(rect: self.rect, zoomRect: self.$zoomRect, animation: self.animation)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
