//
//  WebView.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    typealias UIView = WKWebView
    
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        uiView.load(request)
    }
    
}
