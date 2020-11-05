//
//  MenuCell.swift
//  SelectButtons
//
//  Created by Aaron Lee on 2020-11-05.
//

import SwiftUI

struct MenuCell: View {
    
    let value: String
    let textColor: Color
    let borderColor: Color
    let action: () -> Void
    
    var body: some View {
        
        Text(value)
            .font(.system(size: 14, weight: .black, design: .default))
            .foregroundColor(textColor)
            .frame(width: 44, height: 44, alignment: .center)
            .overlay(
                Circle().stroke(lineWidth: 3)
                    .foregroundColor(borderColor)
                    .frame(width: 44, height: 44, alignment: .center)
            ) //: OUTER CIRCLE
            .padding(5)
            .onTapGesture {
                action()
            }
    }
    
}

struct MenuCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(value: "L", textColor: Color.black, borderColor: Color.black){}
    }
}
