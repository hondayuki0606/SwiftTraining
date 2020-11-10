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
        
        do {
            let object = SomeClass5(id: 42)
            let clousure = {[unowned object] () -> Void in
                print("objectはまだ解放されていません： id=>\(object.id)")
            }
            print("ローカルスコープ内で実行:",terminator: "")
            clousure()
            
            let queue = DispatchQueue.main
            queue.asyncAfter(deadline: .now() + 1){
                print("ローカルスコープ外で実行:")
                clousure() //この時点で実行時エラーになる
            }
        }
        
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

    }
    
    

    
    func swiftTrainingP_59_強制アンラップ() {
        // ■TODO: PAGE 59 強制アンラップ
            // 強制アンラップとはOptional<Wrapped>型からWrapped型を強制的に取り出す方法です。
            // 強制というのは値が存在しなければ、実行次にエラーになるということです。
            // 強制アンラップを行う場合は！を使用します。
        let a:Int? = 1
        let b:Int? = 2
        a! + b! //3
        
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
