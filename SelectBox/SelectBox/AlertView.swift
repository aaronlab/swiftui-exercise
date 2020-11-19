//
//  AlertView.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var isPresented: Bool
    @Binding var option: Option?
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            if option != nil {
                Color.gray
                    .opacity(0.4)
                    .ignoresSafeArea()
                
                VStack {
                    Text(option?.title ?? "asdfasdf")
                        .foregroundColor(Color.black)
                        .padding(16)
                        .frame(width: UIScreen.main.bounds.size.width - 36, height: 100, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(16)
                }
                
            }
            
        }.onAppear {
            if option != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isPresented.toggle()
                    }
                }
            } else {
                self.isPresented.toggle()
            }
        }
        
    }
    
}
