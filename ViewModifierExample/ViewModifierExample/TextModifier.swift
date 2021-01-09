//
//  TextModifier.swift
//  ViewModifierExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct TextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold, design: .default))
            .foregroundColor(.orange)
    }
    
}
