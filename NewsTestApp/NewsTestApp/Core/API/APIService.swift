//
//  APIService.swift
//  NewsTestApp
//
//  Created by Aaron Lee on 2021-01-08.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, APIError>
}

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
