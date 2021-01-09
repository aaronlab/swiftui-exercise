//
//  ContentView.swift
//  test
//
//  Created by Aaron Lee on 2020/12/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ResultView(),
                label: {
                    Text("GO")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ResultView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                })
                Spacer()
                Text("Title")
                Spacer()
                Button(action: {}, label: {
                    Text("Something")
                })
            }
            .padding(.top, UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
            Text("Hello World")
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
        .navigationBarHidden(true)
        
    }
    
}

