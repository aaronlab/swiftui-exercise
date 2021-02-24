//
//  BaseService.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation

class BaseService {
    
    static let shared = BaseService()
    
    private let host = "newsapi.org"
    
    func getURLRequest(path: String = "", queries: [URLQueryItem]? = nil, method: HTTPMethod) -> URLRequest? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queries
        
        guard let url = urlComponents.url else {
            preconditionFailure("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.timeoutInterval = 60.0
        
        return request
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case del = "DELETE"
        case put = "PUT"
    }
    
}
