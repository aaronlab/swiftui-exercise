//
//  SheetView.swift
//  ActionSheetExample2
//
//  Created by Aaron Lee on 2020-11-07.
//

import SwiftUI

struct SheetView: View {
    
    let buttonAction: () -> Void
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Action Sheet")
                    .font(.title)
                    .fontWeight(.bold)
            } //: HSTACK
            .padding()
            
            Button(action: {
                buttonAction()
            }, label: {
                Text("Close")
            }) //: BUTTON
            .padding()
            
        } //: VSTACK
        .padding()
    }
    
}
