//
//  TrainingP61_62.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/17.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation

func 暗黙的にアンラップされたOptionalWrapped型_61(){
//    Optional＜Wrapped＞型にはWrapped?型と表記する糖衣構文がありました。
//    Optional＜Wrapped＞型にはもう一つ、Wrapped！と表記する糖衣構文が
//    用意されています。この糖衣構文によって生成されたOptional＜Wrapped＞型の値は、
//    値へのアクセス次に自動的に強制アンラップを行うため、暗黙的にアンラップされた
//    Optional＜Wrapped＞型と言います。
//    通常のOptional＜Wrapped＞型であるWrapped型？も、暗黙的にアンラップされ
//    たOptional＜Wrapped＞型であるWrapped型！も、同じOptional＜Wrapped＞型であるため、
//    どちらで宣言された定数や変数にも互いの値が代入できます。
    let a:String? = "a"
    let b:String! = "b"
    
    print(type(of:a))
    print(type(of:b))
    
    var c: String! = a
    var d: String! = b
    
    //実行結果
//    Optional＜String＞
//    Optional＜String＞
    
//    暗黙的にアンラップされたOptional＜Wrapped＞型は、アクセス時に
//    毎回強制アンラップが行われるため、Wrapped型と同様に扱えますが、
//    アクセス時にnilであった場合は実行時エラーが発生します。
//    次の例では、Int！型の値とInt型の値の間で演算を行なっています。
//    定数aには値が存在するため演算が成功しますが、変数bには値が存在しないため、実行時エラーとなります。
//
    let a1:Int = 1
    a1 + 1 // Int型と同様に演算が可能

    let b1:Int! = nil
    b1 + 1 // 値が入っていないため、エラー

//    Optional<Wrapped>型の強制アンラップ同様の理由で危険な側面を持っており
//    乱用するべきではありません。
}
