//
//  APIService.swift
//  APITest
//
//  Created by Aaron Lee on 2021-01-09.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
