//
//  SplashScreen.swift
//  Animated Splash
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    
    @State var show = false
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                Color("bg")
                    .ignoresSafeArea()
                
                AnimatedView(show: $show)
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                if show {
                    Color.white
                        .ignoresSafeArea()
                }
            }
        }
        
    }
    
}

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "splash", bundle: Bundle.main)
        view.play { status in
            if status {
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    self.show.toggle()
                }
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
    }
}
