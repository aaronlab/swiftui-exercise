//
//  ContentView.swift
//  Podcast-Player
//
//  Created by Aaron Lee on 2020-10-14.
//

import SwiftUI

struct ContentView: View {
    
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2020")
    
    @State private var isPlaying = false
    
    var body: some View {
        
        VStack {
            
            Text(self.episode.name)
                .font(.title)
                .foregroundColor(isPlaying ? .green : .black)
            
            Text(self.episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPlaying: $isPlaying)
            
        }
        
    }
}

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Button(action: {
            isPlaying.toggle()
        }) {
            
            Text("Play")
            
        }.padding(12)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
