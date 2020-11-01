//
//  OnboardingView.swift
//  Fructus
//
//  Created by Aaron Lee on 2020-11-01.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView()
            }
        } //: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
