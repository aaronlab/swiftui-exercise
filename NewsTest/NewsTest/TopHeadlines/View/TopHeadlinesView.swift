//
//  TopHeadlines.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import SwiftUI

struct TopHeadlinesView: View {
    
    @ObservedObject private var viewModel: TopHeadlinesViewModel
    
    init() {
        self.viewModel = TopHeadlinesViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    
                    
                    
                } //: V
                .padding(.horizontal, 16)
                
            } //: S
            .navigationBarTitle("Top Headlines", displayMode: .large)
            
        } //: N
        
    }
    
}
