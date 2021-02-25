//
//  RoundedRectButton.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct RoundedRectButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 200, height: 44)
            .background(
                Color.black
            )
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
    
}
