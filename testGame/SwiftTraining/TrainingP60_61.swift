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

func mapメソッド61(){
//    また、map()メソッドを用いて、別の方に変換することもできます。
//    次の例では、Int?型の定数aに対して、Int型をString型に変換するクロージャを実行し、
//    結果としてString?型の値'17'を受け取っています。
    let a = Optional(17)
    let b = a.map({value in String(value)}) // '17'
    type(of:b)// Optional<String>.Type
}

func flatMapメソッド61(){
////    flatメソッドもmapメソッド同様の値を変換するクロージャを引数に取りますが、
//    クロージャーの戻り値は、Optional<Wrapped>型です。
//    次の例では、String?型の定数aに対してString型をInt?型に変換する
//    クロージャーを実行し、結果としてInt?型の値Optional(17)を受け取っています。
    let a = Optional("17")
    let b = a.flatMap({value in Int(value)})// 17
    type(of:b)// Optional<Int>.Type
}

func flatMapメソッドとmapメソッドの違い61(){
//    ここでのポイントは、値の有無が不確かな定数に対し、さらに値を返すか
//    定かではない、操作を行っている点です。もし、ここで、flatMapメソッドではなく
//    mapメソッドを使用した場合、最終的な結果は二重に
//    Optional＜Wrap＞型に包まれたInt型??になってしまいます。
    let a = Optional("17")
    let b = a.map({value in Int(value)})// 17
    type(of:b)// Optional<Optional<Int>>.Type
}
