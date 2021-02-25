//
//  TopHeadlines.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import SwiftUI

struct TopHeadlinesView: View {
    
    @ObservedObject private var viewModel: TopHeadlinesViewModel
    
    @State private var destination: AnyView = AnyView(EmptyView())
    @State private var showDetail: NavigationStatus? = .ready
    
    init() {
        self.viewModel = TopHeadlinesViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geo in
                
                ZStack {
                    
                    NavigationLink(
                        destination: destination,
                        tag: .pop,
                        selection: $showDetail) {
                        EmptyView()
                    }
                    
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
                                ) {
                                    popToDetail(at: index)
                                }
                                .frame(height: geo.size.height / 4)
                                .onAppear {
                                    
                                    viewModel.loadMoreIfNeeded(with: article)
                                    
                                }
                                
                            }
                            
                        } //: V
                        .padding(16)
                        
                    } //: S
                    
                    if viewModel.isLoading {
                        
                        Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                        
                        ProgressView()
                        
                    }
                    
                    if viewModel.showToast {
                        AlertToast(message: viewModel.toastMessage)
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
    
    /// Pop to Detail
    private func popToDetail(at index: Int) {
        destination = AnyView(
            TopHeadlinesDetailView(article: viewModel.articles[index])
        )
        showDetail = .pop
    }
    
}
