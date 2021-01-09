//
//  TextFieldModifier.swift
//  MapViewExample
//
//  Created by Aaron Lee on 2021/01/09.
//

import SwiftUI

struct TFModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 0.5)
                    .foregroundColor(.red)
            )
    }
    
}
