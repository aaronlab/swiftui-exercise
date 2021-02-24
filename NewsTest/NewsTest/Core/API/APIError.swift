//
//  APIError.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
