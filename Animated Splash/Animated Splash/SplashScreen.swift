//
//  SplashScreen.swift
//  Animated Splash
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    
    var body: some View {
        
        VStack {
            
            AnimatedView()
        }
        
    }
    
}

struct AnimatedView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "splash.json", bundle: Bundle.main)
        view.play()
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
