//
//  Home.swift
//  CustomSearchNavBar
//
//  Created by Aaron Lee on 2020-12-05.
//

import SwiftUI

struct Home: View {
    
    @Binding var filteredItems: [AppItem]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                ForEach(filteredItems, id: \.id) { item in
                    
                    CardView(item: item)
                }
            }
        }
        .padding([.horizontal, .top])
    }
}
