//
//  SomeClass5.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/08.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//weak キーワードの場合と同様に、unownedキーワードを指定して変数や定数
//をキャプチャした場合も、クロージャは同名の新たな変数や定数を定義し、
//キャプチャ対象となる変数や定数の値を代入します。
//弱酸章を保つため、参照先のインスタンスが既に解放されている可能性があります。
//しかし、解放後もnilにならないので、不正アクセスエラーを発生する場合があります。
import Foundation
import Dispatch

class SomeClass5 {
    let id:Int
    
    init(id:Int) {
        self.id = id
    }
    
    func a (){
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
    }
//    先ほどと同様に、ローカルスコープの実行中は定数objectの値がまだ解放されていないため、正常に実行できます。
//    しかし、ローカルスコープから抜けた1秒後では、定数objectの値が既に解放されているため、実行時エラーとなります。
    
}
