//
//  TopHeadlinesDetailView.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct TopHeadlinesDetailView: View {
    
    private let article: Article
    
    @State private var navigationStatus: NavigationStatus? = .ready
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        ScrollView {
            
            ZStack {
                
                NavigationLink(
                    destination: TopHeadlineWebView(urlString: article.url ?? ""),
                    tag: .pop,
                    selection: $navigationStatus) {
                    EmptyView()
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    if let imgURL = article.imgURL {
                        AsyncImageView(with: imgURL)
                    }
                    
                    Text(article.title ?? "")
                        .font(.title)
                    
                    Text(article.source?.name ?? "")
                        .font(.subheadline)
                    
                    if let author = article.author {
                        
                        Text(author)
                            .font(.subheadline)
                        
                    }
                    
                    Text(article.description ?? "")
                        .font(.body)
                    
                    Spacer(minLength: 0)
                    
                    if article.url != nil {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                navigationStatus = .pop
                            }) {
                                Text("See in Web")
                                    .modifier(RoundedRectButton())
                            }
                            
                        } //: H
                        .padding(.top, 20)
                        
                    }
                    
                } //: V
                
            } //: Z
            .padding(16)
            
        } //: S
        .navigationBarTitle(article.source?.name ?? "Detail", displayMode: .inline)
    }
    
    /// Pop To WebView
    private func popToWebView() {
        guard article.url != nil else { return }
        navigationStatus = .pop
    }
    
}
