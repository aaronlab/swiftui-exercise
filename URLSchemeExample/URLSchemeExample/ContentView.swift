//
//  ContentView.swift
//  URLSchemeExample
//
//  Created by Aaron Lee on 2021-02-19.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var schemeState: SchemeState
    
    @State private var navigationState: NavigationState? = .ready
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                NavigationLink(
                    destination: ProductView(id: schemeState.productId),
                    tag: .prodDetail,
                    selection: $navigationState,
                    label: { EmptyView() }
                )
                .isDetailLink(false)
                
                Text("Main")
                    .padding()
                
            } //: Z
            .navigationTitle("Main")
            
        }
        .onAppear {
            checkScheme()
        }
    }
    
    // Scheme Check
    private func checkScheme() {
        
        if schemeState.productId != "" {
            navigationState = .prodDetail
        }
    }
    
    enum NavigationState {
        case ready
        case prodDetail
    }
    
}
