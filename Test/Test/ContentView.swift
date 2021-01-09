//
//  ContentView.swift
//  Test
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI

struct ContentView: View {
    
    let width = NSScreen.main!.frame.width * 0.6
    let height = NSScreen.main!.frame.height * 0.6
    
    @State private var isPressed = false
    @State private var disabled = false
    
    var body: some View {
        VStack {
            Text(!isPressed ? "눌려주세요" : "왜 눌려?")
                .font(.system(size: 100, weight: .black, design: .default))
                .foregroundColor(.white)
        }
        .frame(minWidth: width * 0.6, minHeight: height * 0.6)
        .frame(maxWidth: width, maxHeight: height)
        .background(Color.black)
        .onTapGesture {
            
            if !disabled {
                self.disabled.toggle()
                self.isPressed.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isPressed.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.disabled.toggle()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
