//
//  Escaping.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/22.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//イニシャライザ、プロパティ、メソッドの内部では、selfキーワードを省
//略してインスタンス自身のプロパティやメソッドにアクセスできると７.2節で
//説明しました。
//ただし、escaping属性を持つ、クロージャの内部は例外であり、
//インスタンス自身のプロパティやメソッドにアクセスするには
//selfキーワードをつける必要があります。escaping属性クロージャで
//selfが必須である理由は、キャプチャによる循環参照に気付くやすくするためです。
//
//例として、escaping属性を持つ、クロージャを引数に取るexecute(_:)メソッドと
//それを呼び出すexecutePrintInd()メソッドを持つExecutor型を見てみましょう。
class Executor {
    let int = 0
    var lastExecutedClousure: (() -> Void)? = nil
    
    func execute(_ clousure: @escaping () -> Void){
        clousure()
        lastExecutedClousure = clousure
    }
    func executePrintInt() {
        execute {
            print(self.int)
        }
    }
}
