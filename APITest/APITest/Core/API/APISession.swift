//
//  APISession.swift
//  APITest
//
//  Created by Aaron Lee on 2021-01-09.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {
        
        return URLSession
        
    }
}
