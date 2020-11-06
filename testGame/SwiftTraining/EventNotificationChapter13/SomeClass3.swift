//
//  SomeClass3.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/07.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
import Dispatch

class SomeClass3 {
    let id:Int
    init(id: Int){
        self.id = id
    }
    func s(){
        let object1 = SomeClass3(id:42)
        let object2 = SomeClass3(id:43)
        
        let closure = {[weak object1, unowned object2] () -> Void in
            print(type(of: object1))
            print(type(of: object2))
        }
        closure()
    }
}

//実行結果
//42
//deinit

// Playgroundで
