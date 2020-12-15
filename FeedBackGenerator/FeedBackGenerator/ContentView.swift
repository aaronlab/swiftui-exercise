//
//  ContentView.swift
//  FeedBackGenerator
//
//  Created by Aaron Lee on 2020-12-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var i = 0
    
    var body: some View {
        VStack {
            
            Text("You pressed: \(i) times")
                .font(.title)
            
            Button(action: {
                self.btnPressed()
            }, label: {
                Text("Press Me")
            })
        }
    }
    
    private func btnPressed() {
        self.i += 1
        
        switch i {
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        case 3:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case 6:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        default:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            i = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
