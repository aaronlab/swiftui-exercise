//
//  ContentView.swift
//  CustomNavBar
//
//  Created by Aaron Lee on 2020-11-17.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @State var navigationStatus: NavigationStatus? = .ready
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Home View")
                
                NavigationLink(
                    destination: ChildView(),
                    tag: .pop,
                    selection: $navigationStatus,
                    label: { EmptyView() }
                )
                
                Button(action: {
                    navigationStatus = .pop
                }, label: {
                    Text("Go to the Child View")
                })
            } //: VSTACK
            
            // NAVIGATION BAR SETUP
            .navBarColor(UIColor.orange)
            .navigationBarTitle("Home View", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            
        } //: NAVIGATION
        
    }
}


/// Enum for Navigation View Auto Pop
enum NavigationStatus {
    case ready, pop
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
