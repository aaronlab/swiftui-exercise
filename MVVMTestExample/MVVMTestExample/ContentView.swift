//
//  ContentView.swift
//  MVVMTestExample
//
//  Created by Aaron Lee on 2021/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: ViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("userName: \(viewModel.user?.userName ?? "Loading...")")
                Text("email: \(viewModel.user?.email ?? "Loading...")")
            }
            .onAppear {
                self.viewModel.getUser()
            }
            
            if self.viewModel.isLoading {
                
                Color.black.opacity(0.2).edgesIgnoringSafeArea(.all)
                
                ProgressView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
