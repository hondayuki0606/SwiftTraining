//
//  delegate.swift
//  testGame
//
//  Created by 本田尚行 on 2020/10/29.
//  Copyright © 2020 本田尚行. All rights reserved.
//
import Foundation

class Delegate {
    func start(){
//    本項では、どのような時にデリゲートパターンを使用するかを説明します。
//        ２つのオブジェクト間で多くの種類のイベント通知を行う場合
//        
//        1 非同期処理を開始したタイミングで、プログレスバーを表示する
//        2 非同期処理の途中で、定期的にプログレスバーを更新する。
//        3 非同期処理が完了したタイミングで、プログレスバーを非表示にする
//        4 非同期処理が失敗したタイミングでプログレスバーで、エラーダイアログを表示する
//        
//        外部からのカスタマイズを前提としたオブジェクトを設計する
//        オブジェクトの中には外部からのカスタマイズを前提とした設計が適しています。そのようなケースでは
//        デリゲートパターンを採用するのが良いでしょう。
//        デリゲートパターンでは、カスタマイズ可能な処理をプロトコルとして定義するため、オブジェクトのどの
//        振る舞いがカスタマイズ可能かは明らかです。
//        
//        例えば、先のUITableViewクラスの場合、画面によって、異なるセルの選択時の動作をデリゲート先に移譲
//        できるようにしています。特定のクラスをカスタマイズする方法として、デリゲートパターンではなく
//        継承を使うことも考えられます。あるクラスを継承するとそのクラスのパブリックなAPI全てがカスタマイズ
//        可能になりますが、クラスによってはカスタマイズして利用されることを想定していない場合もあります。
//        UITableViewクラスの場合は、その基本的な性能は定まっており、変更できません。
//        しかし、どのような情報をどのような見た目で表示するか。
//        タップ側が自由に定義できる秘帖があります。
//        このようにAPIの一部をカスタマイズ可能にしたい場合、軽症ではなくデリゲートパターンを選択するべきです。
    }
}
