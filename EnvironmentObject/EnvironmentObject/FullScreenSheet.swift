//
//  FullScreenSheet.swift
//  EnvironmentObject
//
//  Created by Aaron Lee on 2020-12-18.
//

import SwiftUI

struct FullScreenSheet: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var myObj: MyObject
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Clicked: \(myObj.numberOfClicks)")
                
                Button(action: {
                    myObj.numberOfClicks += 1
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Button")
                })
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.gray.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Sheet")
        }
    }
}

struct FullScreenSheet_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenSheet()
    }
}
