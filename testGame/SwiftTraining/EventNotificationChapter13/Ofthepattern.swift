//
//  Ofthepattern.swift
//  testGame
//
//  Created by 本田尚行 on 2020/12/12.
//  Copyright © 2020 本田尚行. All rights reserved.
//

import Foundation

//本節ではオブザパターンについて説明します。
//ここまで、オブジェクト間でのイベント通知の方法として、デリゲートパターンとクロージャパターンを用いた方法を
//説明してきましたが、これらは１体１のイベント通知でしか有効ではありません。
//例えば、デリゲートパターンでは、デリゲート先となるオブジェクトは１つで同じイベントを複数のオブジェクトで
//受け取ろうとすると、その数だけデリゲート先を追加しなければなりません。
//同じくコールバックも、呼び出し元しか、その結果を知ることはできません。
//
//しかし、１つのイベントの結果を複数のオブジェクトが知る必要がある場合もあります。
//例えば、特定のオブジェクトが変更されたタイミング複数の画面が更新されるようなケースが考えられます。
//オブザパターンがは、こうした１体多のイベント通知を可能にします。実際に、Cocoa Touchではアプリケーションの起動や
//バックグラウンドへの遷移のイベントの通知にオブザパターンを使用しています。
//
//オブザーバーパターンの構成要素は、サブジェクトとオブザーバーです。オブザーバーは通知を受け取る対象で、
//サブジェクトはこのオブザーバーを管理し、必要なタイミングでオブザーバーに通知を発行します。
//通常、この通知は、オブザーバーのメソッドを呼び出すことで行われます。
//
//サブジェクトがオブザーバーに関して知っておく必要があるのは、オブザーバーの通知の受け口であるメソッドの
//インターフェースだけです。そのため、疎結合を保ったままオブジェクト間を連結させることができます。
//一方で、その柔軟さのために、むやみに多様してしまうとどのタイミングで通知が発生するのか予測しずくなり、
//処理を追うのが難しくなってしまいます。
//
//【実装方法】
//通常、iOSやmacOS1アプリケーションでは、オブザパターンをCocoaが提供するNotification型とNotificationCenterクラスを
//用いて、実装します。
//
//NotificationCenterクラスはサブジェクトであり、文字通りの中央に位置するハブのような役割をしています。
//このクラスを通じでオブジェクトは通知の送受信を行います。またオブザーバーはこのクラスに登録され、登録の際に
//通知を受け取るイベントと受け取る際に利用するメソッドを指定します。
//１つのイベントに対して複数のオブザーバーを登録できるので、１体他の関係のイベント通知が可能になります。
//Notification型はNorificationCenterクラスから発行される通知をカプセル化したものです。
//Notification型はname,object,userInfoというプロパティを持っています。
//nameプロパティは通知を特定するためのタグを,objectプロパティは通知を送ったオブジェクトを、userInfoプロパティは通知に関連する
//他の情報をそれぞれ意味します。
//これらの用いたオブジェクト間のイベント通知は、次のような手順で実装します。
//①通知を受け取るオブジェクトにNotification型の値を引数に持つメソッドを実装する
//②NoticationCenterクラスに通知を受け取るオブジェクトを登録する
//③NoticationCenterクラスに通知を投稿する
//
//例を通じて具体的な手順を確認しましょう。ここでは、通知を発生させるPoster型と通知を受け取る
//Observer型を定義し、”SomeNotification”という名前の通知をやり取りします。

class Poster {
    static let notificationName = Notification.Name("SomeNotification")
    func post() {
        NotificationCenter.default.post(
            name: Poster.notificationName, object: nil)
    }
}

class Observer {
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotification(_:)),
                                               name: Poster.notificationName,
                                               object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleNotification(_ notidication: Notification) {
        print("通知を受け取りました")
    }
}
