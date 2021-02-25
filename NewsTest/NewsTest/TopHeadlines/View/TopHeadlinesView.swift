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
            
            GeometryReader { geo in
                
                ZStack {
                    
                    ScrollView {
                        
                        LazyVStack(alignment: .leading, spacing: 16) {
                            
                            ForEach(viewModel.articles.indices, id: \.self) { index in
                                
                                let article = viewModel.articles[index]
                                let title = article.title ?? ""
                                let source = article.source?.name ?? ""
                                let author = article.author ?? ""
                                
                                TopHeadlinesCell(
                                    title: title,
                                    source: source,
                                    author: author
                                )
                                .frame(height: geo.size.height / 4)
                                .onAppear {
                                    print(article.id)
                                }
                                
                            }
                            
                        } //: V
                        .padding(16)
                        
                    } //: S
                    
                    if viewModel.isLoading {
                        
                        Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                        
                        ProgressView()
                        
                    }
                    
                } //: Z
                .frame(width: geo.size.width, height: geo.size.height)
                
            } //: G
            .navigationBarTitle("Top Headlines", displayMode: .large)
            
        } //: N
        .onAppear {
            viewModel.getTopHeadlines()
        }
        .preferredColorScheme(.light)
        
    }
    
}
