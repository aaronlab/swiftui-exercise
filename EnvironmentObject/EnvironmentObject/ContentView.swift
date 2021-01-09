//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Aaron Lee on 2020-12-18.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var myObj: MyObject
    @State private var showFullScreen: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Clicked: \(myObj.numberOfClicks)")
                
                Button(action: {
                    myObj.numberOfClicks += 1
                    showFullScreen.toggle()
                }, label: {
                    Text("Button")
                })
            }
            .fullScreenCover(isPresented: $showFullScreen) {
                FullScreenSheet()
            }
            .navigationBarTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
