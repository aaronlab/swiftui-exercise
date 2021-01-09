//
//  LotteryService.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import Foundation
import Combine

final class LotteryEndpoint {
    
    func getURLRequest(no: String) -> URLRequest {
        guard let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(no)") else { preconditionFailure("Invalid URL Format") }
        return URLRequest(url: url)
    }
    
}

protocol LotteryService {
    var apiSession: APIService { get }
    
    var drwNo: String { get }
    
    func getLotteryResult() -> AnyPublisher<LotteryAPIResponse, APIError>
}

extension LotteryService {
    
    func getLotteryResult() -> AnyPublisher<LotteryAPIResponse, APIError> {
        return apiSession.request(with: LotteryEndpoint().getURLRequest(no: drwNo))
            .eraseToAnyPublisher()
    }
    
}
