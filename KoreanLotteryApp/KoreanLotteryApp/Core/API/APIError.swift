//
//  APIError.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
