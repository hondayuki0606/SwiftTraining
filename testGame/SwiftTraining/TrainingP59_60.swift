//
//  TrainingP59.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/12.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation

func オプショナルチェイン59(){
    // アンラップを使わずに値のプロパティやメソッドにアクセス
    //    オプショナルチェインは、アンラップを伴わずにWrapped型のメンバーにアクセスする気泡です。
    //    Optionarl<Wrapped>型からWrapped型のプロパティにアクセスするには、
    //    一旦オプショナルバインディングなどによってアンラップする必要があります。
    //    次の例では、Optionarl<Double型>からDouble型のisInfiniteプロパティにアクセスするために、
    //    オプショナルバインディングを行っています。
    let optionalDouble = Optional(1.0) // 1
    let optionalDubleIsInfinite: Bool?
    if let double = optionalDouble{
        optionalDubleIsInfinite = double.isInfinite
    }else{
        optionalDubleIsInfinite = nil
        
    }
}
func オプショナルチェイン60(){
//    // オプショナルチェインを用いれば、アンラップを伴わずに<Wrapped>型のプロパティやメソッドにアクセスできます。
//    オプショナルチェインを利用するには、Optional<Wrapped>型の式の後、？に続けてWrapped型のプロパティ名やメソッド名を記述します。
//    例えば、上記の例と同様の処理はOptional Double?.isInfiniteと表現できます。
//    オプショナルチェインでは、Optional<Wrapped>型の変数や定数がnilだった場合、
//    ？以降に記述されたプロパティやメソッドへのアクセスは行わず、nilが返却されます。
//    元のOptional＜Wrapped＞型の式が値を持っていないといことは、
//    アクセス対象のプロパティやメソッドはそんぞいしないといことであり、
//    返すべき値が存在しないためです。
//    次の例では、前述のコードをオプティオナルチェインを使って書き換えたものです。
//    結果はBool？型の値となっています。
    //    オプショナルチェインは、アンラップを伴わずにWrapped型のメンバーにアクセスする気泡です。
    //    Optionarl<Wrapped>型からWrapped型のプロパティにアクセスするには、
    //    一旦オプショナルバインディングなどによってアンラップする必要があります。
    //    次の例では、Optionarl<Double型>からDouble型のisInfiniteプロパティにアクセスするために、
    //    オプショナルバインディングを行っています。
    let optionalDuble  = Optional(1.0) // 1
    let optionalDubleIsInfinite = optionalDuble?.isInfinite
    
    print(String(describing: optionalDubleIsInfinite))
//
//    次の例では、オプショナルチェインを利用して、contains()メソッドを呼び出し、
//    CountableRange<Int>?型の定数optionalRangeの範囲に指定した値が
//    含まれるかどうかを判定しています。
//    同じく、結果はBool？型の値です。
    let optionalRange = Optional(0..<10)
    let containsSeven = optionalRange?.contains(7)
    
    print(String(describing: containsSeven)) // Optional(true)
}
