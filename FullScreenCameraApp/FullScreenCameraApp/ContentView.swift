//
//  ContentView.swift
//  FullScreenCameraApp
//
//  Created by Aaron Lee on 2020-11-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                CameraViewController()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Rectangle().stroke(Color.black, lineWidth: 3)
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.width * 0.63, alignment: .center)
                    Text("Scanning your credit card...")
                    
                    Spacer()
                } //: VSTACK
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            } //: ZSTACK
        } //: GEOMETRY
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
