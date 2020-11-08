//
//  SomeClass5.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/08.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//この例では、クロージャclorure内で参照するクラスの定数objectにweakキーワードを
//指定しています。ローカルスコープの実行中と実行から1秒経過後のそれぞれにクロージャclosureを
//実行し、キャプチャされた定数objectの値を出力しています。
import Foundation
import Dispatch

class SomeClass5 {
    let id:Int
    
    init(id:Int) {
        self.id = id
    }
    
}
