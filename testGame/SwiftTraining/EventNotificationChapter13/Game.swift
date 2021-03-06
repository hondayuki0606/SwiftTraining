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
// twoPersonsGame.delegate = delegate // エラーが発生 Expressions are not allowed at the top level
// twoPersonsGame.start() // エラーが発生 Expressions are not allowed at the top level
//ここでは、プレイヤーの人数とゲームの開始、終了時の処理を異常するための
//インターフェイスをGameDelefateプロトコルとして宣言しています。
//Two PersonsGam DelefagatクラスはこのGame Delegateプロトコルに準拠したクラスです。
//GameクラスはDelegateプロパティを持っており、その型はGameDelegateです。
//Swiftでは、プロトコルも型として扱うことができるため、Delegateプロパティには
//GameDelegateプロパティに準拠した値であれば、なんでも代入できます。
//GameクラスはStartメソッドの中で、このDelegateプロパティを通じて、デリゲート先にプレイヤーの人数を
//問い合わせていきます。またゲームの開始、終了のタイミングをデリゲート先に伝えていきます。

//■命名規則
//デリゲートパターンでは、デリゲート先にデリゲート元から呼び出される
//メソッド群を実装する必要があります。
//どのようなメソッド群を実装する必要があるかはプロトコルとして宣言します。
//プロトコルやメソッドの命名については、Cocoa、Cocoa　Touchフレームワーク内で
//利用されているデリゲートパターンが使われているコンポーネントの中でも特に利用頻度が高いものの１つですが、
//そのデリゲートメソッドのうちUITableViewのセルがタップされた際に実行される
//デリゲートメソッドは次のように宣言されています。

//以下は、TableViewで最も使用されるデリゲートパターン
//public protocol UITableViewDelegate : NSObjectProtocol,
//                                      UIScrollViewDelegate{
//    
//    optional public func tableView(
//        _ tableView: UITableView
//        didSelectRowAt indexPath: IndexPath)
//}

//デリゲートパターンでは、様々なタイミングでデリゲート先のメソッド
//が実行されるため、どのタイミングで呼び出されるということをdidや
//willといった助動詞を用いて表現します。
//このメソッドはセルたタップされた直後に実行されるdidSelectを用いています。
//またデリゲート元はデリゲート先が必要としているである情報を引数を通じて
//渡します。ここではどのインデックスのせるがタップされたかとIndexPath型は
//入れ子になった配列の特定のノードを指すための構造体です。
//さて、ここまでの説明から、次のメソっとで事足りるように思われるかもしれません。
//func didSelectRow(indexPath : IndexPath)

//しかし、このままでは、複数のプロトコル二従居する際に似たような役割を持った
//デリゲートメソッド同士の名前が衝突する可能性があります。
//そこでCocoaメソッドのデリゲートパターンでは、第一引数にデリゲート元のオブジェクトを渡す
//ことになっています。
//tableView(_:didSelectRow:)メソッドのデリゲート元は
//UITableVieクラスであるため、メソッド名はtableViewから始まりこれが
//名前空間の役割を果たします。

//以上の命名規則をまとめると、次のようになります。
//・メソッド名はデリゲート元のオブジェクト名から初め、続いてイベントの説明をする
//・didやwillなどの助動詞を用いてイベントのタイミングを示す
//・第一引数にはデリゲート元のオブジェクトを渡す



