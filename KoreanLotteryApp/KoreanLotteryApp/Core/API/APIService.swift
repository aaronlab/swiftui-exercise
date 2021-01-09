//
//  APIService.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import Foundation
import Combine

protocol APIService {
    
    func request<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, APIError>
    
}
