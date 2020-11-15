//
//  HomeViewModel.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject, LotteryService {
    
    // PROTOCOLS
    var apiSession: APIService
    @Published var drwNo: String
    
    // PROPERTIES
    @Published var response: LotteryAPIResponse?
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession(), drwNo: String) {
        self.apiSession = apiSession
        self.drwNo = drwNo
    }
    
    func getLotteryResult() {
        self.getLotteryResult()
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle the error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { response in
                self.response = response
            }.store(in: &cancellables)
        
    }
    
    
}
