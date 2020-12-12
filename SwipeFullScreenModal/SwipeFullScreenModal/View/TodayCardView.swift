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
    
    var body: some View {
        
        VStack {
            
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
                        .foregroundColor(.white)
                    
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                } //: V
                
                Spacer(minLength: 0)
                
                VStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Text("GET")
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
            .padding()
        } //: V
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}
