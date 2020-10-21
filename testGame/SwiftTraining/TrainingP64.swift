//
//  TrainingP64.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/21.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
class TrainingP64 {
    func タプル型（複数の型をまとめる型）_64(){
        //    本節では、複数の型をまとめて１つの型として扱うタプル型について説明します。
        //    タプルを定義するには、要素となる型を（）内に区切りで（型名１、型名２、型名３）のように列挙します。
        //    タプル型の要素にはどのような型も指定でき、要素数にも制限はありません。次の例では、Int型、String型を
        //    まとめた（Int型、String型）の変数TUPLEを定義しています。
        var tuple: (Int,String)
        
        //タプル型の値をタプルといい、タプルを生成するには、要素となる値を（）
        //    内に区切りで（要素１、要素２、要素３）のように列挙します。
        //    次の例では、先ほどの（Int型、String型）の変数TUPLEにタプル（１、”あ”）を代入していきます。
        tuple = (1,"a")
        //    要素へのアクセス
        //    タプルの要素へのアクセス方法には、インデックスによるアクセス、要素名によるアクセス
        //    、代入によるアクセスの３つがあります。
        //    本項ではこれらについて説明します。
        //
        //    インデックスによるアクセス
        //    タプルの要素にはインデックスを通じてアクセスできます。変数や定数に、をつけて、変数名.インデックスという書式で
        //    アクセスします。最初の要素のインデックスは０から１、２と続きます。
        //    次の例では、（Int、String）のタプル(1,"a")の各要素にインデックスでアクセスしています。
        //    tupel.0は１つ目の要素1を返し、tuple.1は２つ目の要素"a"を返します。
        let int = tuple.0 // 1
        let string = tuple.1 // "a"
    }
}
