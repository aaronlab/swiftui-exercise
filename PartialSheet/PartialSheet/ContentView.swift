//
//  ContentView.swift
//  PartialSheet
//
//  Created by Aaron Lee on 2020-11-03.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var bottomSheetIsShowing: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            
            ZStack {
                GeometryReader { proxy in
                    
                    VStack {
                        
                        Button(action: {
                            bottomSheetIsShowing = true
                            print(bottomSheetIsShowing)
                        }) {
                            Text("SHOW BOTTOM SHEET")
                        } //: BUTTON
                        
                    } //: VSTACK
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    
                } //: GEOMETRY
                .navigationBarTitle("Title", displayMode: .inline)
                
                if bottomSheetIsShowing {
                    BottomSheet()
                        .edgesIgnoringSafeArea(.all)
                }
                
            }
            
            
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
