//
//  GameScene.swift
//  testGame
//
//  Created by 本田尚行 on 2019/12/25.
//  Copyright © 2019 本田尚行. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    enum Optional<Wrapped>{
//        case none
//        case some(Wrapped)
//    }
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
            
            let none = Optional<Int>.none
            print(".none: \(String(describing: none))")
            
            let some = Optional<Int>.some(1)
            print(".some: \(String(describing: some))")
        
            let some1 = Optional.some(1) // Optional<Int>型
            // let none1: Int? = Optional.none // コンパイルエラー
            
            var a: Int?
            
            a = nil // nilリテラルの代入による.noneの生成
            // a = Optional(1) // イニシャライザによる.someの生成 コンパイルエラー 'ViewController.Optional<Wrapped>' cannot be constructed because it has no accessible initializers
            a = 1 // 値の代入による.someの生成
        
        // PAGE 56
        let optionalInt: Int? = nil
        let optionalString: String? = nil
        
        print(type(of: optionalInt), String(describing: optionalInt))
        print(type(of: optionalString), String(describing: optionalString))
        
        let nila:Int? = nil
        // let nulb: = nil 定数の型が決まらないため、コンパイルエラー
        
        let optionalInt2 = Optional(1)
        let optionalString2 = Optional("a")
        
        print(type(of: optionalInt2), String(describing: optionalInt2))
        print(type(of: optionalString2), String(describing: optionalString2))
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
