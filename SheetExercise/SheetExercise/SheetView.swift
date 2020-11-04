//
//  SheetView.swift
//  SheetExercise
//
//  Created by Aaron Lee on 2020-11-04.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentMode
    
    @State var isCoverShowing = false
    
    var body: some View {
        Button(action: {
            isCoverShowing.toggle()
        }) {
            Text("Show Full Screen Cover")
        } //: BUTTON
        .fullScreenCover(isPresented: $isCoverShowing) {
            FullScreenCover()
        }
    }
}
