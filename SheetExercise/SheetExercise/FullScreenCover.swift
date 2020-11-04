//
//  FullScreenCover.swift
//  SheetExercise
//
//  Created by Aaron Lee on 2020-11-04.
//

import SwiftUI

struct FullScreenCover: View {
    @Environment(\.presentationMode) var presentMode
    
    @State var shouldBeClosed = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink("Go to the Second View", destination: SecondCover(coverShouldBeClosed: $shouldBeClosed))
                
            } //: VSTACK
            .navigationBarTitle("First Cover", displayMode: .inline)
            .onAppear {
                if shouldBeClosed {
                    presentMode.wrappedValue.dismiss()
                }
            }
            
        } //: NAVIGATION
    }
}
