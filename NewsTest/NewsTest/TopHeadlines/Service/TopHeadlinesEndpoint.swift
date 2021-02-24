//
//  NewsListEndpoint.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation

final class TopHeadlinesEndpoint: BaseService {
    
    func getTopHeadlines(page: Int, pageSize: Int) -> URLRequest? {
        var queries: [URLQueryItem] {
            return [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "pageSize", value: "\(pageSize)"),
                URLQueryItem(name: "apiKey", value: "\(apiKey)")
            ]
        }
        
        return getURLRequest(path: "/v2/top-headlines", queries: queries, method: .get)
    }
    
}
