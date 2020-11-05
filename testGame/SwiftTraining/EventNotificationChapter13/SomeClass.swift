//
//  SomeClass.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/01.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation

//キャプチャリストーーーキャプチャ時の参照方法の制御
//６.３章で解説したように、クロージャのキャプチャとは、クロージャ定義
//されたスコープに総菜する変数や定数への参照を、クロージャないのスコープでも保持することを言います。
//ここでは、キャプチャ字の参照方法の制御について説明します。
//
//デフォルトでは、キャプチャはクラスのインスタンスへの強参照となります。
//そのため、クロージャが解放されない限りはキャプチャされたクラスのインスタンスは解放されません。

class SomeClass {
    let id: Int
    init(id: Int){
        self.id = id
    }
    deinit{
        print("deinit")
    }

    func exe(){
        do{
            let object = SomeClass(id: 42)
            
            let queue = DispatchQueue.main
            queue.asyncAfter(deadline: .now()+3) {
                print(object.id)
            }
        }
        
        let object1 = SomeClass(id: 42)
        let object2 = SomeClass(id: 42)
        //　クロージャーの呼び出し後に行われる処理
        let closure = {[weak object1, unowned object2] ()-> Void in
            print(type(of: object1))
            print(type(of: object2))
        }
//        weakキーワードを指定して、変数や定数をキャプチャした場合、クロージャは
//        optional<warapped>型の同名の変数を新たに定義し、キャプチャ対象となる変数や定数に値を代入します。
//        参照先のインスタンスが既に解放されていた場合、Weakキーワードを指定してキャプチャした変数や定数は
//        自動的にnilとなります。そのため、不正な変数や定数へのアクセスは心配ありません。
        
    
    }
}

// 実行結果
//42
//deinit
