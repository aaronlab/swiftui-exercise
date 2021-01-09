//
//  CardView.swift
//  ActionSheetExample
//
//  Created by Aaron Lee on 2020-11-07.
//

import SwiftUI

struct CardView: View {
    @State var filter: FilterItem
    
    var body: some View {
        
        HStack {
            Text(filter.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .stroke(filter.checked ? Color.green : Color.gray, lineWidth: 1)
                    .frame(width: 25, height: 25)
                
                if filter.checked {
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color.green)
                    
                }
                
            } //: ZSTACK
        } //: HSTACK
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
        .onTapGesture {
            filter.checked.toggle()
        }
    }
}
