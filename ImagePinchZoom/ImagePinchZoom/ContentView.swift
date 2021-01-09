//
//  ContentView.swift
//  ImagePinchZoom
//
//  Created by Aaron Lee on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            Image("sample")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(self.scale)
                .frame(width: UIScreen.main.bounds.width * self.scale, height: UIScreen.main.bounds.height * self.scale)
        }
        .gesture(
            MagnificationGesture()
                .onChanged(self.onChanged(with:))
        )
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    private func onChanged(with value: CGFloat) {
        self.scale = value
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
