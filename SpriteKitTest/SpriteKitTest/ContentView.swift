//
//  ContentView.swift
//  SpriteKitTest
//
//  Created by Aaron Lee on 2021/02/23.
//

import SwiftUI
import SpriteKit

struct SpriteKitContainer: UIViewRepresentable {
    
    typealias UIViewType = SKView
    
    var skScene: SKScene!
    
    init(scene: SKScene) {
        skScene = scene
        self.skScene.scaleMode = .resizeFill
    }
    
    func makeUIView(context: Context) -> SKView {
        let view = SKView(frame: .zero)
        view.preferredFramesPerSecond = 60
        view.showsFPS = true
        view.showsNodeCount = true
        
        return view
    }
    
    func updateUIView(_ view: SKView, context: Context) {
        view.presentScene(context.coordinator.scene)
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.scene = self.skScene
        return coordinator
    }
    
    class Coordinator: NSObject {
        var scene: SKScene?
    }
    
}

class SpriteScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    func makeCircle(screenWidth: CGFloat, screenHeight: CGFloat) {
        
        let size: CGFloat = 50
        
        let x = CGFloat.random(in: 0...screenWidth - size)
        
        let circle = SKShapeNode(circleOfRadius: size)
        circle.fillColor = .red
        circle.position = CGPoint(x: x, y: screenHeight)
        circle.physicsBody = SKPhysicsBody(circleOfRadius: size)
        
        addChild(circle)
    }
    
}

struct ContentView: View {
    
    private let scene: SpriteScene
    
    init(_ scene: SpriteScene = SpriteScene()) {
        self.scene = scene
    }
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                SpriteKitContainer(scene: scene)
                    .frame(width: geo.size.width, height: geo.size.height - 50)
                
                Button(action: {
                    scene.makeCircle(screenWidth: geo.size.width, screenHeight: geo.size.height - 50)
                }) {
                    Text("Make Circle")
                } //: B
                
            } //: V
            
        } //: G
        
    }
    
}
