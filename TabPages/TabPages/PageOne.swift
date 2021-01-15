//
//  PageOne.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageOne: View {
    
    @State private var showCard = false
    
    @State private var cardTitles = ["First", "Second", "Third"]
    
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
                
                ForEach(self.cardTitles.indices, id: \.self) { index in
                    
                    CardView(title: self.cardTitles[index]) {
                        
                        self.cardTitles.remove(at: index)
                        
                        if self.cardTitles.count == 0 {
                            self.showCard.toggle()
                            self.cardTitles = ["First", "Second", "Third"].reversed()
                        }
                    }
                }
            }
            
        }
        .onAppear {
            self.cardTitles.reverse()
        }
    }
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne()
    }
}
