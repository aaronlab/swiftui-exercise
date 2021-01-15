//
//  CardView.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct CardView: View {
    
    private let title: String
    
    @State private var dragPosition: CGFloat = 0.0
    
    let completion: (() -> Void)?
    
    init(title: String, completion: (() -> Void)? = nil) {
        self.title = title
        self.completion = completion
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.16), radius: 10, x: 0.0, y: 0.0)
                    .overlay(
                        Text(self.title)
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.7)
                    .gesture(
                        DragGesture()
                            .onChanged(self.onDrag(value:))
                            .onEnded(self.onEnded(value:))
                    )
                    .rotationEffect(.init(degrees: Double(self.dragPosition * 0.2)))
                    .offset(x: self.dragPosition)
            }
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
    }
    
    func onDrag(value: DragGesture.Value) {
        let value = value.translation.width
        if (value < 0 && value > -150)
            ||
            (value > 0 && value < 150) {
            self.dragPosition = value
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        let value = value.translation.width
        if (value > 0 && value < 50)
            ||
            (value < 0 && value > -50) {
            
            withAnimation {
                self.dragPosition = 0
            }
        } else {
            
            if value > 0 {
                
                withAnimation(.easeInOut(duration: 0.3)) {
                    
                    self.dragPosition = UIScreen.main.bounds.width * 2
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    completion?()
                    self.dragPosition = 0.0
                }
                
            } else {
                
                withAnimation {
                    
                    withAnimation(.easeInOut(duration: 0.3)) {
                        
                        self.dragPosition = -(UIScreen.main.bounds.width * 2)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        completion?()
                        self.dragPosition = 0.0
                    }
                }
            }
        }
        
    }
}
