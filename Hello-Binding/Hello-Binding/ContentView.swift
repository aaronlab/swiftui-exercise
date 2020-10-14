//
//  ContentView.swift
//  Hello-Binding
//
//  Created by Aaron Lee on 2020-10-14.
//

import SwiftUI

struct ContentView: View {
    
    var model = Dish.all()
    
    @State private var isSpicy = false
    
    var body: some View {
        
        List {
            
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title)
            }
            
            ForEach(model.filter { $0.isSpicy == self.isSpicy }) { dish in
                
                HStack {
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(dish.name)
                        .font(.title)
                        .lineLimit(nil)
                    
                    Spacer()
                    
                    if (dish.isSpicy) {
                        Text("🥵")
                    }
                    
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
