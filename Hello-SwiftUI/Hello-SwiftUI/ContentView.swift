//
//  ContentView.swift
//  Hello-SwiftUI
//
//  Created by Aaron Lee on 2020-10-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("First Line")
                .font(.largeTitle)
                .foregroundColor(.green)
            Text("Second Line")
                .font(.title)
            HStack {
                Text("First Line")
                Spacer()
                Text("Second Line")
            }
            ZStack {
                Text("First Line")
                    .foregroundColor(.orange)
                Text("Second Line")
                    .padding(.all)
            }
        }.padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
