//
//  TodayCardView.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI

struct TodayCardView: View {
    let item: TodayItem
    
    @Environment(\.colorScheme) var color
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: item.contentImage, in: animation)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            
            HStack {
                
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(item.title)
                        .fontWeight(.bold)
                    
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                } //: V
                
                Spacer(minLength: 0)
                
                VStack {
                    
                    Button(action: {}, label: {
                        
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                    }) //: B
                    
                    Text("In App Purchase")
                        .font(.caption)
                        .foregroundColor(.gray)
                } //: V
            } //: H
            .matchedGeometryEffect(id: item.id, in: animation)
            .padding()
        } //: V
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}
