//
//  NetworkUtil.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import Foundation
import Combine

struct NetworkUtil {
    
    static let shared = NetworkUtil()
    
    private init(){}
    
    func handleNetworkResult(with result: Subscribers.Completion<APIError>, onError: ((APIError) -> Void)? = nil) {
        
        switch result {
        case .failure(let error):
            onError?(error)
            
            #if DEBUG
            print("Handle Error: \(error)")
            #endif
        case .finished:
            break
        }
        
    }
    
}
