//
//  ContentView.swift
//  ObservableObjectExample
//
//  Created by Aaron Lee on 2020-10-15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
                .padding()
            
            Button("Increment Score ") {
                self.userSettings.score += 1
            }
            
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
