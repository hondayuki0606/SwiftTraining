//
//  SomeClass3.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/07.
//  Copyright © 2020 本田尚行. All rights reserved.
//
//この例では、クロージャclorure内で参照するクラスの定数objectにweakキーワードを
//指定しています。ローカルスコープの実行中と実行から1秒経過後のそれぞれにクロージャclosureを
//実行し、キャプチャされた定数objectの値を出力しています。
import Foundation
import Dispatch

class SomeClass4 {
    let id:Int
    
    init(id: Int){
        self.id = id
    }
    
    func s(){
        let object = SomeClass4(id:42)
        let closure = {[weak object] () -> Void in
            if let o = object {
                print("objectはまだ解放されていません: id => \(o.id)")
            }else{
                print("objectは既に削除されました")
            }
        }
        print("ローカルスコープ内で実行:",terminator: "")
        closure()
        
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: .now()+1){
            print("ローカルスコープ外で実行:",terminator: "")
            closure()
        }
        
    }
}

//実行結果
//42
//deinit

// Playgroundで
