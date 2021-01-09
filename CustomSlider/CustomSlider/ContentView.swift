//
//  ContentView.swift
//  CustomSlider
//
//  Created by Aaron Lee on 2020-11-09.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var percentage1: Float = 30
    @State var navigationStatus: NavigationStatus? = .ready
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(
                    destination: Text("Unlocked!"),
                    tag: NavigationStatus.pop,
                    selection: $navigationStatus) {
                    EmptyView()
                }
                
                Slider(percentage: $percentage1) {
                    self.navigationStatus = .pop
                } //: SLIDER
                    .accentColor(.black)
            } //: VSTACK
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
            .navigationBarTitle("Slide to Unlock!")
        } //: NAVIGATION
    }
}

enum NavigationStatus {
    case ready
    case pop
}
