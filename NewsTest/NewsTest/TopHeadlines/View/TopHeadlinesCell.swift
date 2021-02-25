//
//  TopHeadlinesCell.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct TopHeadlinesCell: View {
    
    private let title: String
    private let source: String
    private let author: String
    
    private var subTitle: String {
        return "\(source) / \(author)"
    }
    
    init(
        title: String,
        source: String,
        author: String
    ) {
        self.title = title
        self.source = source
        self.author = author
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text(title)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .font(.title2)
            
            HStack {
                
                Spacer(minLength: 16)
                
                Text(subTitle)
                
            } //: H
            
        } //: V
        .padding(16)
        .background(
            Color(UIColor.systemBackground)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: -5, y: -5)
        )
        
    }
    
}
