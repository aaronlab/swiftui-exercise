//
//  Home.swift
//  CustomSearchNavBar
//
//  Created by Aaron Lee on 2020-12-05.
//

import SwiftUI

struct Home: View {
    
    @State var filteredItems = AppItem.placeholder()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                ForEach(filteredItems, id: \.id) { item in
                    
                    CardView(item: item)
                }
            }
        }
        .padding(.horizontal)
    }
}
