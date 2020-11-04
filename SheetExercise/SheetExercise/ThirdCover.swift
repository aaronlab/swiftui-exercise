//
//  ThirdCover.swift
//  SheetExercise
//
//  Created by Aaron Lee on 2020-11-04.
//

import SwiftUI

struct ThirdCover: View {
    @Environment(\.presentationMode) var presentMode
    
    @Binding var coverShouldBeClosed: Bool
    
    var body: some View {
        VStack {
            Text("The Third Cover")
            
            Button(action: {
                coverShouldBeClosed = true
                presentMode.wrappedValue.dismiss()
            }) {
                Text("Close Covered View")
            }
            
        } //: VSTACK
        .navigationBarTitle("Third Cover", displayMode: .inline)
    }
}
