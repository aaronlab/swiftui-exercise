//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Aaron Lee on 2020-11-03.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var bottomCircleSize: CGFloat = 150
    @State private var bottomCircleOpacity: Double = 0.3
    @State private var bottomCircle2Size: CGFloat = 150
    @State private var bottomCircle2Opacity: Double = 0.3
    @State private var dotRotateDegree: Double = 0.0
    @State private var isAnimating: Bool = false

    // MARK: - BODY

    var body: some View {
        GeometryReader { proxy in

            ZStack {

                // Background
                K.Colors.background

                // 1st Circle
                Circle()
                    .frame(width: bottomCircleSize)
                    .foregroundColor(K.Colors.button.opacity(bottomCircleOpacity))

                // 2nd Circle
                Circle()
                    .frame(width: bottomCircle2Size)
                    .foregroundColor(K.Colors.button.opacity(bottomCircle2Opacity))

                // Outer Dot
                VStack {
                    Circle()
                        .frame(width: 20, height: 20, alignment: .top)
                        .foregroundColor(K.Colors.button)

                    Spacer(minLength: 0)
                } //: VSTACK
                .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: dotRotateDegree))

                // Button
                Button(action: {
                    animateBottomCircle()
                }, label: {
                        Circle()
                            .foregroundColor(K.Colors.button)
                            .frame(width: 150, height: 150)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
                    }) //: BUTTON
                .disabled(isAnimating)

            } //: ZSTACK
            .frame(width: proxy.size.width, height: proxy.size.height)

        } //: GEOMETRY
        .ignoresSafeArea()
    }
}

extension ContentView {

    func animateBottomCircle() {
        if !isAnimating {
            isAnimating = true

            // 1st Circle + Outer Dot
            withAnimation(.easeOut(duration: 2)) {
                bottomCircleSize = UIScreen.main.bounds.height
                bottomCircleOpacity = 0.0
                dotRotateDegree = 360.0
            }

            // 2nd Circle
            withAnimation(.easeOut(duration: 2.5)) {
                bottomCircle2Size = UIScreen.main.bounds.height
                bottomCircle2Opacity = 0.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // 1st Circle
                withAnimation(.easeOut(duration: 2.0)) {
                    bottomCircleSize = 150
                    bottomCircleOpacity = 0.3
                }

                // 2nd Circle + Outer Dot
                withAnimation(.easeInOut(duration: 2.5)) {
                    bottomCircle2Size = 150
                    bottomCircle2Opacity = 0.3
                    dotRotateDegree = 0.0
                }
            }

            // Reset Flag
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isAnimating = false
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
