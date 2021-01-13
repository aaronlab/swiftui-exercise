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
        
        ZStack {
            
            
        } //: Z
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.showToast.toggle()
                }
            }
        }
        
    }
    
}
