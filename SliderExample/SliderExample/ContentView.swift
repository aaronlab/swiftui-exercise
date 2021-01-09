//
//  ContentView.swift
//  SliderExample
//
//  Created by Aaron Lee on 2020-10-27.
//

import SwiftUI

struct ContentView: View {

    var colours: [Color] = [.black, .red, .green, .blue]
    var colourNames = ["Black", "Red", "Green", "Blue"]

    @State private var colourIndex: Int = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Hello SwiftUI"

    var body: some View {
        VStack {
            Spacer()

            Text(text)
                .font(.largeTitle)
                .fontWeight(.black)
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut(duration: 1))
                .foregroundColor(self.colours[colourIndex])
                .padding()
            
            Spacer()

            Slider(value: $rotation, in: 0...360, step: 10)
                .padding()

            TextField("Text Here", text: $text)
                .disableAutocorrection(false)
                .autocapitalization(.none)
                .padding()

            Picker(selection: $colourIndex, label: Text("Picker")) {
                ForEach(0..<colourNames.count) {
                    Text(self.colourNames[$0])
                        .foregroundColor(colours[$0])
                }
            }.padding()
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
