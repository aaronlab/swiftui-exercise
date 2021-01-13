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
            
            Button(action: {
                self.showToast.toggle()
            }, label: {
                Text("Show Toast")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
