//
//  ContentView.swift
//  Selectable
//
//  Created by Aaron Lee on 2021/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonTitles = ["Happy", "Sad", "Angry", "Bad"]
    @State private var selectedTitles = Set<String>()
    
    var body: some View {
        GeometryReader { geo in
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHStack {
                    
                    ForEach(self.buttonTitles.indices, id: \.self) { index in
                        
                        self.makeButton(with: self.buttonTitles[index])
                            .padding(.horizontal, 30)
                    }  //: F
                    
                } //: LH
                .padding(.horizontal, 16)
                
            } //: S
            
        } //: G
    }
}

// MARK: - View Methods

extension ContentView {
    
    
    /// 옵션 버튼을 만듭니다
    private func makeButton(with title: String) -> some View {
        return Button(action: {
            self.buttonPressed(with: title)
        }, label: {
            Text(title)
                .foregroundColor(self.isSelected(with: title) ? .white : .black)
                .frame(width: 50, height: 50)
        })
        .background(
            self.isSelected(with: title)
                ?
                Color.orange
                .modifier(ButtonBackgroundModifier())
                :
                Color.white
                .modifier(ButtonBackgroundModifier())
        )
    }
    
    /// Pressed Button
    private func buttonPressed(with title: String) {
        withAnimation {
            if self.selectedTitles.contains(title) {
                let _ = self.selectedTitles.remove(title)
            } else {
                self.selectedTitles.insert(title)
            }
        }
    }
    
    /// Check
    private func isSelected(with title: String) -> Bool {
        return self.selectedTitles.contains(title)
    }
    
}

/// Button Background
struct ButtonBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.16), radius: 5, x: -5, y: -5)
            .shadow(color: Color.black.opacity(0.16), radius: 5, x: 5, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
