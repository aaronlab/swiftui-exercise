//
//  AlertToast.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct AlertToast: View {
    
    private let message: String
    
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                VStack {
                 
                    Spacer(minLength: 0)
                    
                    Text(message)
                        .lineLimit(1)
                        .frame(width: geo.size.width - 32, height: 80)
                        .background(Color.red.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    
                }
                
            } //: Z
            .frame(width: geo.size.width, height: geo.size.height)
            
        } //: G
        
    }
    
}
