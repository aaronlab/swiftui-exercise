//
//  ContentView.swift
//  GraphExample
//
//  Created by Aaron Lee on 2020-12-16.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDrawing: Bool = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.gray)
            
            ChartView(xStepValue: 1, yStepValue: 1, data: data, lineRadius: 1)
                .padding()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .shadow(color: Color.white.opacity(0.16), radius: 5, x: 5, y: 5)
        .shadow(color: Color.white.opacity(0.16), radius: 5, x: -5, y: -5)
    }
}

struct ChartView: View {
    let xStepValue: CGFloat
    let yStepValue: CGFloat
    let data: [Point]
    let lineRadius: CGFloat
    
    private var maxYValue: CGFloat {
        data.max { $0.y < $1.y }?.y ?? 0
    }
    
    private var maxXValue: CGFloat {
        data.max { $0.x < $1.x }?.x ?? 0
    }
    
    private var xStepsCount: Int {
        Int(self.maxXValue / self.xStepValue)
    }
    
    private var yStepsCount: Int {
        Int(self.maxYValue / self.yStepValue)
    }
    
    var body: some View {
        ZStack {
            chartBody
        }
    }
    
    private var chartBody: some View {
            GeometryReader { geometry in
                Path { path in
                    path.move(to: .init(x: 0, y: geometry.size.height))
                    // 1
                    var previousPoint = Point(x: 0, y: geometry.size.height)
                    
                    self.data.forEach { point in
                        let x = (point.x / self.maxXValue) * geometry.size.width
                        let y = geometry.size.height - (point.y / self.maxYValue) * geometry.size.height
                        
                        // 2
                        let deltaX = x - previousPoint.x
                        let curveXOffset = deltaX * self.lineRadius
                        
                        // 3
                        path.addCurve(to: .init(x: x, y: y),
                                      control1: .init(x: previousPoint.x + curveXOffset, y: previousPoint.y),
                                      control2: .init(x: x - curveXOffset, y: y ))
                        
                        previousPoint = .init(x: x, y: y)
                    }
                }
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 3)
                )
            }
    }
}

struct Point {
    let x: CGFloat
    let y: CGFloat
}

let data: [Point] = [
    .init(x: 1, y: 5),
    .init(x: 2, y: 4),
    .init(x: 3, y: 15),
    .init(x: 4, y: 6),
    .init(x: 5, y: 9),
    .init(x: 6, y: 12),
    .init(x: 7, y: 14),
    .init(x: 8, y: 11)
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
