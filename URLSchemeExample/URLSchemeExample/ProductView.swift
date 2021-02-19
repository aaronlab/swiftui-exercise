//
//  ProductView.swift
//  URLSchemeExample
//
//  Created by Aaron Lee on 2021-02-19.
//

import SwiftUI

struct ProductView: View {
    
    let id: String
    
    var body: some View {
        Text("ProductID: \(id)")
            .navigationBarTitle("Product", displayMode: .large)
    }
}
