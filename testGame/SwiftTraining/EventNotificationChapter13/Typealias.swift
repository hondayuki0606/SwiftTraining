//
//  Typealias.swift
//  testGame
//
//  Created by 本田尚行 on 2020/11/25.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation
//typealias キーワードを用いることで、複雑なクロージャの型の方エイリアスを設定できます。
//それぞれのクロージャ型にも型があり、その型の引数と戻り値の型で決まります。
//例えば、Int型の引数を１つ受け取り、String型を戻り値として返すクロージャ型(Int)->Stringです。
//しかし、引数に複雑な型のクロージャをとる関数の定義は、かなり読みにくくなってしまいます。
//次の例では、引数のクロージャの方が(Int?,Error?,Array<String>?)->Void型となっており、
//型の意味の理解には時間がかかります。
func someMethod(complention:(Int?,Error?,Array<String>?)->Void){}
//
//このケースでは、typealiasキーワードを用いて、クロージャの型の型エイリアスを設定すると
//可読性が高くなります。次の例では、(Int?,Error?,Array<String>?) -> Void型のクロージャに
//CompletionHandler型という型エイリアスを設定した結果、型の意味の理解が簡単になりました。

typealias CompletionHandler = (Int?,Error?,Array<String>?)->Void

func someMethod(completion: CompletionHandler){}

//このようにすれば、何度も同じクロージャーの型が出てくる場合もコードが
//煩雑になりません。また、クロージャーが何を意味しているかも型エイリアスを通じて
//明確にできます。
