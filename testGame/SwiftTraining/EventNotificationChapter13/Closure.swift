//
//  Closure.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/01.
//  Copyright © 2020 本田尚行. All rights reserved.
//
//    本節ではクロージャーを利用したコールバックについて説明する。
//    非同期処理のためにDispatchモジュールのAPIの多くはコールバックをクロージャで受け取ります。
//    クロージャを用いると、呼び出し元と同じ場所にコールバック処理を記述できるので処理の流れを追いやすくなります。
//    一方で、複数のコールバック関数が必要であったり、コールバック次の処理が複雑な場合は、クロージャの性質上、
//    ネストが深くなり、可読性が下がってしまいます。
//
//■実装方法
//  クロージャによるコールバックの受け取るを実装するには、非同期処理を行うメソッドの引数にクロージェを追加します。
// 非同期処理を行うメソッドでは、処理の完了時にコールバックを受け取るクロージャを実行し、結果をクローズ屋の引数に渡します。
import Foundation

class Closure{
    private var result = 0
    
    func start(completion: (Int) -> Void){
        print("playing")
        result = 42
        completion(result)
    }
    
}

class test{
    func start(){
        let game = Closure()
        game.start { result in
            print("Result is \(result)")
        }
    }
}
