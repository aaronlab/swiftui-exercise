//
//  ContentView.swift
//  DatePickerViewExample
//
//  Created by Aaron Lee on 2021/01/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dateText: String = ""
    @State private var showPicker: Bool = false
    
    var body: some View {
        ZStack {
            
            self.makeMainView()
            
            if self.showPicker {
                
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                Color.black.opacity(0.16)
                    .edgesIgnoringSafeArea(.all)
                
                self.makePickerView()
            }
        }
    }
}

extension ContentView {
    
    /// MAIN VIEW
    private func makeMainView() -> some View {
        VStack {
            
            Button(action: self.toggleShowPicker) {
                Text("Show Picker")
            }
            
            Text("Selected Date: \(self.dateText)")
            
        }
    }
    
    private func makePickerView() -> some View {
        return VStack {
            
            DatePicker(dateText: self.$dateText)
                .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 2)
            
            Button(action: self.toggleShowPicker) {
                Text("Select")
            }
        }
    }
    
    private func toggleShowPicker() {
//        withAnimation {
            self.showPicker.toggle()
//        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
