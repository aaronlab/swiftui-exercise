//
//  ContentView.swift
//  ActionSheetExample2
//
//  Created by Aaron Lee on 2020-11-07.
//

import SwiftUI

struct ContentView: View {
    
    @State var showActionSheet: Bool = false
    
    var body: some View {
        ZStack {
            
            // BUTTON
            Button(action: {
                withAnimation {
                    showActionSheet.toggle()
                }
            }, label: {
                Text("Show Action Sheet")
                    .font(.title2)
            }) //: BUTTON
            
            
            VStack {
                
                Spacer()
                
                SheetView {
                    withAnimation {
                        showActionSheet.toggle()
                    }
                } //: SHEETVIEW
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
                .background(Color.white)
                .offset(y: showActionSheet ? 0 : UIScreen.main.bounds.height / 2)
                
            } //: VSTACK
            .frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea()
            .background(
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .opacity(self.showActionSheet ? 1 : 0)
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        withAnimation {
                            showActionSheet.toggle()
                        }
                    })
            ) //: BACKGROUND
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
