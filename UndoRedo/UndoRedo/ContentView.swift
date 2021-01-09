//
//  ContentView.swift
//  UndoRedo
//
//  Created by Aaron Lee on 2021/01/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rectangles = [AnyView]()
    @State private var willRedo = [AnyView]()
    @State private var colorIndex = 0
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                HStack {
                    
                    Button(action: undo) {
                        Text("Undo")
                    }
                    
                    Spacer()
                    
                    Button(action: redo) {
                        Text("Redo")
                    }
                } //: H
                .padding()
                
                GeometryReader { recs in
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                        
                        if !rectangles.isEmpty {
                            ForEach(self.rectangles.indices, id: \.self) { index in
                                
                                self.rectangles[index]
                            }
                        }
                        
                    } //: Z
                    .frame(width: recs.size.width, height: recs.size.height)
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged { val in
                                self.makeRectangle(x: val.location.x, y: val.location.y)
                            }
                    )
                }
                
            } //: V
            
        }
        
    }
    
    private func makeRectangle(x: CGFloat, y: CGFloat) {
        self.willRedo.removeAll()
        let newRect = Rectangle()
            .frame(width: 20, height: 20)
            .position(x: x, y: y)
            .foregroundColor(self.getColor())
        self.rectangles.append(AnyView(newRect))
    }
    
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
