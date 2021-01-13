//
//  ContentView.swift
//  ToastViewExample
//
//  Created by Aaron Lee on 2021/01/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showToast: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.3)) {
                    self.showToast.toggle()
                }
            }, label: {
                Text("Show Toast")
            })
            
            if self.showToast {
                
                ToastView(showToast: self.$showToast)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
