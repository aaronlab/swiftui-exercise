//
//  Today.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI

struct Today: View {
    
    var animation: Namespace.ID
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("SATURDAY 14 NOVEMBER")
                            .foregroundColor(.gray)
                        
                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    } //: V
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    } //: B
                    
                } // : H
                .padding()
                
                ForEach(items, id: \.id) { item in
                    
                    TodayCardView(item: item, animation: animation)
                }
            } //: V
            .padding(.bottom)
        } //: SCROLL
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}
