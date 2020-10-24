//
//  TrainingP288.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/24.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//iosやMacOs向けのアプリケーションをSwiftで実装する場合、
//Applega開発したCocoaやCocoa Touchというオブジェクト指向のAPI群を利用します。
//これらのAPIにおいて、オブジェクト間のイベント通知の方法は次の３つに大別されます。
//・デリゲートパターン
//・クロージャ
//・オブザーバパターン
//
//これらの３つのパターンの正しい理解は、CocoaやCocoa　Touchを利用するとき
//だけでなく、みなさんがアプリケーションを実装する際にも有用です。
//本章では、この３つの方法を順番に説明していきます。
//13.2　デリゲートパターン

protocol GameDelegate: class {
    var numberOfPlayres:Int {get}
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

class TwoPersonsGameDelegate: GameDelegate {
    var numberOfPlayres: Int {return 2}
    func gameDidStart(_ game: Game) { print("Game start") }
    func gameDidEnd(_ game: Game) { print("Game end") }
}

class Game {
    weak var delegate: GameDelegate?
    func start(){
        print("Number of playrs is \(delegate?.numberOfPlayres ?? 1)")
        delegate?.gameDidStart(self)
        print("Playing")
        delegate?.gameDidEnd(self)
    }
}
let delegate = TwoPersonsGameDelegate()
var twoPersonsGame = Game()
twoPersonsGame.delegate = delegate // エラーが発生 Expressions are not allowed at the top level
twoPersonsGame.start() // エラーが発生 Expressions are not allowed at the top level
