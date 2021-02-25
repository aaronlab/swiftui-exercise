//
//  TopHeadlinesResponse.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation

struct TopHeadlinesResponse: Decodable, APIResponse {
    
    let status: String?
    
    let totalResults: Int?
    
    let articles: [Article]?
    
}
