//
//  PageOne.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageOne: View {
    
    @State private var showCard = false
    
    private let cardTitles = ["First", "Second", "Third"]
    
    var body: some View {
        ZStack {
            Color.green
            
            Button(action: {
                
                self.showCard.toggle()
            }, label: {
                Text("One")
                    .foregroundColor(.white)
            })
            
            if self.showCard {
                
                ForEach(self.cardTitles.reversed(), id: \.self) { card in
                    
                    CardView(title: card)
                }
            }
            
        }
    }
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne()
    }
}
