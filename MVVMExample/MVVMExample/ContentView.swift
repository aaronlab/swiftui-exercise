//
//  ContentView.swift
//  MVVMExample
//
//  Created by Aaron Lee on 2020-11-29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: CounterViewModel
    
    init() {
        viewModel = CounterViewModel()
    }
    
    var body: some View {
        VStack {
            
            if viewModel.premium {
                Text("PREMIUM")
                    .foregroundColor(.green)
                    .frame(height: 100)
                    .font(.largeTitle)
            }
            
            Text("\(viewModel.value)")
                .font(.largeTitle)
            Button("Increment") {
                viewModel.increment()
            }
        } //: VSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
