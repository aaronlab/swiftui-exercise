//
//  NavBarModifier.swift
//  CustomNavBar
//
//  Created by Aaron Lee on 2020-11-17.
//

import SwiftUI


/// Navigation Bar Modifier for Navigation Bar Background Color
struct NavBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    func body(content: Content) -> some View {
        ZStack {
            
            content
            
            VStack {
                
                GeometryReader { geometry in
                    
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    
                    Spacer()
                }
            } //: VSTACK
            .shadow(color: Color.black.opacity(0.16), radius: 0, x: 0, y: 0.5)
            
        } //: ZSTACK
    }
    
}
