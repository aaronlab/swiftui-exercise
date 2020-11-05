//
//  MenuCell.swift
//  SelectButtons
//
//  Created by Aaron Lee on 2020-11-05.
//

import SwiftUI

struct MenuCell: View {
    
    let option: MenuOption
    let textColor: Color
    let borderColor: Color
    
    var body: some View {
        
        ZStack {
            
            Text(option.name == .color ? "" : option.value)
                .font(.system(size: 14, weight: .black, design: .default))
                .foregroundColor(textColor)
                .frame(width: 44, height: 44, alignment: .center)
            
            // INNER CIRCLE
            if option.name == .color {
                Circle()
                    .foregroundColor(Color(option.value))
                    .frame(width: 40, height: 40, alignment: .center)
            } else {
                Circle()
                    .stroke()
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            
            // OUTER CIRCLE
            Circle()
                .stroke()
                .foregroundColor(borderColor)
                .frame(width: 44, height: 44, alignment: .center)
            
        } //: ZSTACK
        .frame(width: 44, height: 44, alignment: .center)
        .padding(16)
        
    }
    
}

struct MenuCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(option: MenuOption(name: .size, value: Sizes.large.rawValue), textColor: Color.black, borderColor: Color.black)
        MenuCell(option: MenuOption(name: .color, value: Colors.red.rawValue), textColor: Color.black, borderColor: Color.black)
    }
}
