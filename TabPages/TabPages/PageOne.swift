//
//  PageOne.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageOne: View {
    
    @State private var showCard = false
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                
                withAnimation {
                    self.showCard.toggle()
                }
            }, label: {
                Text("One")
                    .foregroundColor(.white)
            })
            
            if self.showCard {
                
                CardView(title: "Card")
            }
            
        }
    }
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne()
    }
}
