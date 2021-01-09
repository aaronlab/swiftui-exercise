//
//  MainView.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    
    @Binding var showMenu: Bool
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                showMenu = true
            }
        }, label: {
            Text("Show Side Menu")
        })
        
    }
}
