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

    // Pagination
    private let pageSize: Int
    @Published var page: Int
    
    @Published private  var topHeadlinesResponse: TopHeadlinesResponse?
    
    @Published var isLoading: Bool
    @Published var showToast: Bool
    
    init(_ apiSession: APIService = APISession()) {
        
        self.apiSession = apiSession
        self.cancellables = Set<AnyCancellable>()
        
        self.pageSize = 10
        self.page = 1
        
        self.isLoading = false
        self.showToast = false
        
    }
    
    /// Get Top Headlines
    func getTopHeadlines() {
        startLoading()
        
        self.getTopHeadlines(page: page, pageSize: pageSize)
            .sink { result in
                
                NetworkUtil.shared.handleNetworkResult(with: result) { _ in
                    self.endLoading()
                }
                
            } receiveValue: { response in
                
                if response._status == .ok {
                    
                    self.topHeadlinesResponse = response
                    
                } else {
                    
                    DispatchQueue.main.async {
                        self.showToast = true
                    }
                    
                }
                
                self.endLoading()
                
            }
            .store(in: &cancellables)
    }
    
    /// Start Loading
    func startLoading() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    /// End Loading
    func endLoading() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
}

extension TopHeadlinesViewModel {
    
    var totalResults: Int {
        return topHeadlinesResponse?.totalResults ?? 0
    }
    
    var articles: [Article] {
        return topHeadlinesResponse?.articles ?? [Article]()
    }
    
}
