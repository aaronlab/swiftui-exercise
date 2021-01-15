//
//  ContentView.swift
//  SingleTon
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fullScreen = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                NavigationLink("Second View", destination: SecondView())
                
                Button(action: {
                    self.fullScreen.toggle()
                }, label: {
                    Text("FULL SCREEN")
                })
                
                Button(action: {
                    MyClass.shared.value += 1
                }, label: {
                    Text("UP")
                })
            }
            .fullScreenCover(isPresented: self.$fullScreen, content: {
                FullScreen()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
