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

    }
}

// 実行結果
//42
//deinit
