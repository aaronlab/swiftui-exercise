//
//  APIService.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, APIError>
}
