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
    private let action: (() -> Void)?
    
    private var subTitle: String {
        return "\(source)\(author != "" ? " / \(author)" :  "")"
    }
    
    init(
        title: String,
        source: String,
        author: String,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.source = source
        self.author = author
        self.action = action
    }
    
    var body: some View {
        
        Button(action: {
            action?()
        }) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text(title)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    Text(subTitle)
                        .font(.subheadline)
                    
                } //: H
                
            } //: V
            
        }
        .foregroundColor(.primary)
        .padding(16)
        .background(
            Color(UIColor.systemBackground)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: -5, y: -5)
        )
        
    }
    
}
