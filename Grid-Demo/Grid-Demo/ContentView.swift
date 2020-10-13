//
//  ContentView.swift
//  Grid-Demo
//
//  Created by Aaron Lee on 2020-10-13.
//

import SwiftUI

struct ContentView: View {

    let dishes = Dish.all()

    var body: some View {

        let chunckedDishes = dishes.chunked(into: 3)

        return List {

            //rows
            ForEach(0..<chunckedDishes.count) { index in

                HStack {

                    ForEach(chunckedDishes[index]) { dish in

                        Image(dish.imageURL)
                            .resizable()
                            .scaledToFit()

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
