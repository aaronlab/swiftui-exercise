//
//  TopHeadlinesViewModel.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021/02/24.
//

import Foundation
import Combine

final class TopHeadlinesViewModel: ObservableObject, TopHeadlinesService {
    
    var apiSession: APIService
    
    private var cancellables: Set<AnyCancellable>
    
    init(_ apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        self.cancellables = Set<AnyCancellable>()
    }
    
    func getTopHeadlines() {
        self.getTopHeadlines(page: 1, pageSize: 1)
            .sink { result in
                NetworkUtil.shared.handleNetworkResult(with: result)
            } receiveValue: { response in
                print(response)
            }
            .store(in: &cancellables)

    }
    
}
