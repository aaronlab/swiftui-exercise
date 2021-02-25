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
    @Published var articles: [Article]
    var totalResults: Int {
        return topHeadlinesResponse?.totalResults ?? 0
    }
    
    @Published var isLoading: Bool
    
    var toastMessage: String
    @Published var showToast: Bool
    
    init(_ apiSession: APIService = APISession()) {
        
        self.apiSession = apiSession
        self.cancellables = Set<AnyCancellable>()
        
        self.pageSize = 10
        self.page = 1
        
        self.articles = [Article]()
        
        self.isLoading = false
        
        self.toastMessage = ""
        self.showToast = false
        
    }
    
    /// Get Top Headlines
    func getTopHeadlines() {
        startLoading()
        
        self.getTopHeadlines(page: page, pageSize: pageSize)
            .sink { result in
                
                NetworkUtil.shared.handleNetworkResult(with: result) { error in
                    self.endLoading()
                    
                    let message = self.getDescription(with: error)
                    self.showToast(with: message)
                }
                
            } receiveValue: { response in
                
                self.endLoading()
                
                if response._status == .ok {
                    
                    self.topHeadlinesResponse = response
                    
                    guard let articles = response.articles else { return }
                    self.articles += articles
                    
                } else {
                    
                    self.showToast(with: response.message ?? "Response Error")
                    
                }
                
            }
            .store(in: &cancellables)
    }
    
    /// Infinite Scroll
    func loadMoreIfNeeded(with article: Article) {
        if articles.count < totalResults && article == articles.last {
            page += 1
            getTopHeadlines()
        }
    }
    
    /// Start Loading
    private func startLoading() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    /// End Loading
    private func endLoading() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    /// Show Toast
    private func showToast(with text: String) {
        
        toastMessage = text
        
        DispatchQueue.main.async {
            self.showToast = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showToast = false
        }
        
    }
    
    /// Error Description
    private func getDescription(with error: APIError) -> String {
        switch error {
        case .decodingError:
            return "Decoding Error Occured"
        case .unknown:
            return "Unknown Error Occured"
        case .httpError(let status):
            return "Network Error Occured(\(status))"
        }
    }
    
}
