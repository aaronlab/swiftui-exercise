//
//  ContentView.swift
//  SheetExercise
//
//  Created by Aaron Lee on 2020-11-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSheetShowing = false
    
    var body: some View {
        NavigationView {
            Button(action: {
                isSheetShowing.toggle()
            }) {
                Text("Show Sheet")
            } //: BUTTON
            .sheet(isPresented: $isSheetShowing) {
                SheetView()
            }
            .navigationBarTitle("Root View")
        } //: NAVIGATIO
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
