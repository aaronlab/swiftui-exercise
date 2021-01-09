//
//  ContentView.swift
//  TextFieldExample
//
//  Created by Aaron Lee on 2021/01/09.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 0.3)
            .repeatForever()
    }
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                TextField("Placeholder", text: self.$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text(self.text)
                
                Spacer()
            } //: V
            .frame(width: geo.size.width, height: geo.size.height)
        } //: G
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
