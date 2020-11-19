//
//  BoxCell.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import SwiftUI

struct BoxCell: View {
    // MARK: - PROPERTIES
    
    var isSelected: Bool
    let title: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            // RADIO
            ZStack(alignment: .center) {
                
                Circle()
                    .stroke()
                    .foregroundColor(isSelected ? .black : .gray)
                    .frame(width: 10, height: 10, alignment: .center)
                
                if isSelected {
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: 6, height: 6, alignment: .center)
                }
            } //: RADIO
            
            Text(title)
                .foregroundColor(isSelected ? .black : .gray)
            
            Spacer()
        } //: HSTACK
        .contentShape(Rectangle())
        
    }
}
