//
//  TopHeadlineWebView.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct TopHeadlineWebView: View {
    
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        WebView(urlString: urlString)
            .navigationBarTitle("News", displayMode: .inline)
    }
    
}
