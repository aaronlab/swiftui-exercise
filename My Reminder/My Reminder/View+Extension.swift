//
//  View+Extension.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

extension View {
    
    func defaultShadow(radius: CGFloat) -> some View {
        self.shadow(color: Color.black.opacity(0.3), radius: radius, x: 0.0, y: 0.0)
    }
    
}
