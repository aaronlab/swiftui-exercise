//
//  BottomSheet.swift
//  PartialSheet
//
//  Created by Aaron Lee on 2020-11-03.
//

import SwiftUI

struct BottomSheet: View {
    
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.5)
         
            Text("Hello, World!")
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: 400, alignment: .bottom)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
