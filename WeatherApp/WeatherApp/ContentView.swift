//
//  ContentView.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-12-07.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject var viewModel: WeatherViewModel
    
    init() {
        self.viewModel = WeatherViewModel()
    }
    
    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$viewModel.cityName, onCommit:  {
                self.viewModel.search()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.custom("Arial", size: 40))
            .padding()
            
            HStack {
                Text(self.viewModel.temperature == "" ? "Please search..." : self.viewModel.temperature)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 40))
                    .offset(y: 100)
                    .padding()
                
                Spacer()
            }
            
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.orange)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
