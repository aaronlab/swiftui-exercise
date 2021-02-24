//
//  NewsListService.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation
import Combine

protocol TopHeadlinesService {
    var apiSession: APIService { get }
}

extension TopHeadlinesService {
    
    func getTopHeadlines(page: Int, pageSize: Int) -> AnyPublisher<TopHeadlinesResponse, APIError> {
        guard let request = TopHeadlinesEndpoint().getTopHeadlines(page: page, pageSize: pageSize) else {
            preconditionFailure("Invalid URL")
        }
        return apiSession.request(with: request)
            .eraseToAnyPublisher()
    }
    
}
