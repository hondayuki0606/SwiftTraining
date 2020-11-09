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
    
}
