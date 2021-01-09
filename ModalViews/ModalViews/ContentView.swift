//
//  ContentView.swift
//  ModalViews
//
//  Created by Aaron Lee on 2020-11-11.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                Text("Text")
                
                Button(action: {
                    self.partialSheetManager.showPartialSheet {
                        BottomSheet()
                    }
                }) {
                    Text("Show Bottom Sheet")
                }
                
                Spacer()
            }
            
        } //: GEOMETRY
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
