//
//  TrainingP60_61.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/13.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation

func mapメソッドとflatMapメソッド60(){
//    // アンラップを行わずに値の変換を行うメソッド
//    mapメソッドとflatMapメソッドはアンラップを行わずに変換を行うメソッドです。
//    mapメソッドには値を変換するクロージャーを渡します。
//    Wrapped型の値が存在すれば、クロージャーを実行して、値を変換し、値が存在しなければ何も行いません。
//    次の処理はInt?型の定数の値を２倍にする方法です。
    let a = Optional(17)
    let b = a.map({value in value * 2}) // 34
    type(of:b)// Optional<Int>.Type
}
