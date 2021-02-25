//
//  Article.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import Foundation

struct Article: Decodable {
    
    let source: Source?
    
    let author: String?
    
    let title: String?
    
    let description: String?
    
    let url: String?
    
    let imgURL: String?
    
    let publishedAt: String?
    
    let content: String?
    
}

extension Article {
    
    enum CodingKeys: String, CodingKey {
        
        case source, author, title, description, url, publishedAt, content
        
        case imgURL = "urlToImage"
        
    }
    
}
