//
//  SomeClass2.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/04.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//import PlaygroundSupport
import Dispatch

class SomeClass2 {
    let id:Int
    init(id: Int){
        self.id = id
    }
    deinit {
        print("deinit")
    }
    func s(){
        do{
            let object = SomeClass(id: 42)
            let queue = DispatchQueue.main
            queue.asyncAfter(deadline: .now()+3) {
                print(object.id)
            }
        }
    }
}

//実行結果
//42
//deinit

// Playgroundで
