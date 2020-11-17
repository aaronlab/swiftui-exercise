//
//  View+Extension.swift
//  CustomNavBar
//
//  Created by Aaron Lee on 2020-11-17.
//

import SwiftUI

extension View {
    
    /// Set Navigation Bar Color
    /// - Parameter backgroundColor: UIColor you want
    /// - Returns: some View
    func navBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavBarModifier(backgroundColor: backgroundColor))
    }
    
}
