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
        
        do{
            let object = SomeClass(id: 42)
            
            let queue = DispatchQueue.main
            queue.asyncAfter(deadline: .now()+3) {
                print(object.id)
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
    
    func swiftTrainingP57() {
    // ■TODO: PAGE 57
        // 値の代入による.someの生成
        let optionalInt1: Int? = 1
        print(type(of: optionalInt1), String(describing: optionalInt1))
        // Optional＜Wrapped＞型のアンラップ--値の取り出し
        // Optional<Wrapped>型は値を持っていない可能性があるため、
        // Wrapped型の変数や定数と同じように扱うことはできません。
        // たとえば、Int?同士の四則演算はコンパイルエラーになります。
        let a:Int? = 1
        let b:Int? = 1
        // a+b// コンパイルエラー
        
        // オプショナルバインディング
        // ??演算子
        // 強制アンラップ
        
    }
    
    func swiftTrainingP57_58_オプショナルバインディング() {
    // ■TODO: PAGE 57-58 オプショナルバインディング
        // オプショナルバインディングでは、条件分岐分や繰り返し文の条件に
        // Optional<Wrapped>の値を指定する。
        // 値の存在が保証されている分岐内では、Wrapped型に直接アクセスすることが出来ます。
        // オプショナルバインディングはif-let文を用いて行います。
//        if let 定数名 = Optional<Wrapped>型の値{
//            値が存在する場合に実行される文
//        }
        // 実例
        let optionalA = Optional("a") // String?型
        if let a = optionalA {
            print(type(of:a))// optionalに値がある場合のみ表示される
        }
    }
    
    func swiftTrainingP_58_はてなはてな演算子() {
        // ■TODO: PAGE 58 はてなはてな演算子
            // Optional<Wrapped>型に値が存在しない、場合のデフォルト値では、
            // デフォルト値を指定するには、中値演算子??を使います。
            // ??演算子の式は左辺にOptional<Wrapped>型の値、右辺にはWrappedアタ型の値をとります。
            // 左辺にOptional値がない場合、右辺のWrapped型を返します。
            // 実例
        let optionalInt1: Int? = 1
        let int1 = optionalInt1 ?? 3 // 1
        
        let optionalInt2: Int? = nil
        let int2 = optionalInt2 ?? 3 // 3
        
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
