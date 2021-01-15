//
//  SecondView.swift
//  SingleTon
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                MyClass.shared.value += 1
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("\(MyClass.shared.value)")
            })
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
