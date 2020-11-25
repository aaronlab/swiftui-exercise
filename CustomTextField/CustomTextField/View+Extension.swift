//
//  View+Extension.swift
//  CustomTextField
//
//  Created by Aaron Lee on 2020-11-25.
//

import SwiftUI

extension View {
    
    func defaultBorder(borderColor: Color) -> some View {
        self.padding(16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke()
                    .foregroundColor(borderColor)
            )
    }
    
}
