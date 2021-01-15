//
//  PageOne.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageOne: View {
    
    @State private var showCard = false
    
    @State private var cardTitles = ["Third", "Second", "First"]
    
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
                
                ForEach(self.cardTitles, id: \.self) { cardTitle in
                    
                    CardView(title: cardTitle) {
                        
                        self.cardTitles.remove(at: self.cardTitles.count - 1)
                        
                        if self.cardTitles.count == 0 {
                            self.showCard.toggle()
                            self.cardTitles = ["Third", "Second", "First"]
                        }
                    }
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
