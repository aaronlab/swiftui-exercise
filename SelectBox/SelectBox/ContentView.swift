//
//  ContentView.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject private var viewModel: ViewModel = ViewModel()
    
    @State private var alertIsShowing: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        
        
        ZStack(alignment: .center) {
            ScrollView {
                
                VStack {
                    
                    if let options = viewModel.options {
                        
                        ForEach(options, id: \.id) { option in
                            BoxCell(isSelected: option.title == viewModel.selectedOption?.title, title: option.title)
                                .padding(16)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.alertIsShowing.toggle()
                                        viewModel.selectedOption = option
                                    }
                                }
                            
                            Divider()
                        }
                        
                    }
                    
                } //: VSTACK
            } //: SCROLL
            
            if alertIsShowing {
                AlertView(isPresented: $alertIsShowing, option: $viewModel.selectedOption)
            }
        } //: ZSTACK
        .onAppear {
            viewModel.loadOptions()
        }
        
    }
}
