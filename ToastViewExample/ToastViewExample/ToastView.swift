//
//  ToastView.swift
//  ToastViewExample
//
//  Created by Aaron Lee on 2021/01/14.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var showToast: Bool
    
    init(showToast: Binding<Bool>) {
        self._showToast = showToast
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                VisualEffectView(effect: UIBlurEffect(style: .light))
                    .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 8.0)
                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 4, y: 4)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: -4, y: -4)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black.opacity(0.8))
                } //: Z
                .offset(y: self.showToast ? 0 : geo.size.height)
                
            } //: Z
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.spring()) {
                    self.showToast.toggle()
                }
            }
        }
        
    }
    
}
