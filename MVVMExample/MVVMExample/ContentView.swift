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
