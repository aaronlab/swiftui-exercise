//
//  ContentView.swift
//  GridSwiftUI
//
//  Created by Aaron Lee on 2020-10-12.
//

import SwiftUI

struct ContentView: View {

    let animals = ["🐕", "🦓", "🦔", "🦕", "🦘", "🐕", "🦓", "🦔"]
    @State private var sliderValue: CGFloat = 1

    var body: some View {
        NavigationView {

            VStack {
                Slider(value: $sliderValue, in: 1...CGFloat(self.animals.count), step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())

                List(self.animals.chunks(size: Int(self.sliderValue)), id: \.self) { chunk in

                    ForEach(chunk, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size:
                                            CGFloat(200/self.sliderValue)))
                    }

                }
            }

                .navigationTitle("Animals")

        }


    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
