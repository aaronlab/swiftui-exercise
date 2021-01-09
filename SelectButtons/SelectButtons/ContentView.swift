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
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        
                        // OPTIONS
                        ForEach(viewModel.options, id: \.self) { option in
                            MenuCell(value: option,
                                     textColor: option == viewModel.selectedOptions ? Color.orange : Color.gray,
                                     borderColor: option == viewModel.selectedOptions ? Color.orange : Color.gray) {
                                withAnimation(.easeOut(duration: 0.3)) {
                                    viewModel.selectedOptions = option
                                }
                            }
                        } //: OPTIONS
                        
                    } //: HSTACK
                    .frame(width: geometry.size.width, alignment: .center)
                    
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("You selected: ")
                            .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            .foregroundColor(.gray)
                        
                        Text(viewModel.selectedOptions)
                            .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            .foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                } //: VSTACK
                
            } //: GEOMETRY
            .navigationBarTitle("Select Buttons")
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
