//
//  ContentView.swift
//  SelectButtons
//
//  Created by Aaron Lee on 2020-11-05.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject var viewModel: ViewModel
    
    // MARK: - INIT
    
    init() {
        self.viewModel = ViewModel()
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                
                
                
            } //: GEOMETRY
            
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
