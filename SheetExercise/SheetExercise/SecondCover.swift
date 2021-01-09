//
//  SecondCover.swift
//  SheetExercise
//
//  Created by Aaron Lee on 2020-11-04.
//

import SwiftUI

struct SecondCover: View {
    @Environment(\.presentationMode) var presentMode
    
    @Binding var coverShouldBeClosed: Bool
    
    var body: some View {
        VStack {
            Text("The Second Cover")
            
            NavigationLink("Go to the Third View", destination: ThirdCover(coverShouldBeClosed: $coverShouldBeClosed))
            
            Button(action: {
                coverShouldBeClosed = true
                presentMode.wrappedValue.dismiss()
            }) {
                Text("Close Covered View")
            }
            
        } //: VSTACK
        .navigationBarTitle("Second Cover", displayMode: .inline)
        .onAppear {
            if coverShouldBeClosed {
                presentMode.wrappedValue.dismiss()
            }
        }
    }
}
