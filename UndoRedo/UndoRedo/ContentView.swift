//
//  ContentView.swift
//  UndoRedo
//
//  Created by Aaron Lee on 2021/01/09.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var rectangles = [AnyView]()
    @State private var willRedo = [AnyView]()
    @State private var colorIndex = 0
    private let gesture: DragGesture = DragGesture(minimumDistance: 0, coordinateSpace: .local)
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                self.makeMenuBar()
                
                GeometryReader { rects in
                    
                    ZStack {
                        
                        self.makeBackground()
                        
                        if !self.rectangles.isEmpty {
                            self.makeRectsView()
                        }
                        
                    } //: Z
                    .frame(width: rects.size.width, height: rects.size.height)
                    .gesture(
                        self.gesture
                            .onChanged(self.makeRectangle(_:))
                    )
                } //: G2
                
            } //: V
            
        } //: G1
        
    }
    
}

// MARK: - Make Views

extension ContentView {
    
    /// Menu Bar
    private func makeMenuBar() -> some View {
        return HStack {
            
            Button(action: undo) {
                Text("Undo")
            }
            
            Spacer()
            
            Button(action: redo) {
                Text("Redo")
            }
        } //: H
        .padding()
    }
    
    /// Background
    private func makeBackground() -> some View {
        return Rectangle()
            .foregroundColor(self.getBackgroundColor())
    }
    
    /// Rectangles View
    private func makeRectsView() -> some View {
        return ForEach(
            self.rectangles.indices,
            id: \.self
        ) { index in
            self.rectangles[index]
        }
    }
    
    /// Background Color
    private func getBackgroundColor() -> Color {
        return self.colorScheme == .dark ? .black : .white
    }
    
}

// MARK: - Business Logic

extension ContentView {
    
    /// Rectangle Color
    private func makeRectangle(_ value: DragGesture.Value) {
        if !self.rectangles.isEmpty {
            self.willRedo.removeAll()
        }
        let newRect = Rectangle()
            .frame(width: 20, height: 20)
            .position(x: value.location.x, y: value.location.y)
            .foregroundColor(self.getColor())
        self.rectangles.append(AnyView(newRect))
    }
    
    /// Rectangle Color
    private func getColor() -> Color {
        switch self.colorIndex {
        case 0:
            self.colorIndex += 1
            return .red
        case 1:
            self.colorIndex += 1
            return .green
        case 2:
            self.colorIndex = 0
            return .blue
        default:
            return .black
        }
    }
    
    /// Undo
    private func undo() {
        if !self.rectangles.isEmpty {
            switch self.colorIndex {
            case 0:
                self.colorIndex = 2
            default:
                self.colorIndex -= 1
            }
            self.willRedo.append(self.rectangles.removeLast())
        }
    }
    
    /// Redo
    private func redo() {
        if !self.willRedo.isEmpty {
            switch self.colorIndex {
            case 2:
                self.colorIndex = 0
            default:
                self.colorIndex += 1
            }
            self.rectangles.append(self.willRedo.removeLast())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
