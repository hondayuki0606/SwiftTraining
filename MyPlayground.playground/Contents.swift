import Cocoa

var str = "Hello, playground"

var a = 1234
var b = "abc"
a = 89
let ass = 1+2
let asss = "a" + "b"
print("Hello!")

var a1 : Int
let b1 : Int
a1 = 1
b1 = 1
//b1 = 2 コンパイルエラー

let assb = 1
type(of:assb)

let str2 = "hello,World"
str2.count //11
str2.starts(with: "hello") //ture

let original = [1,2,3]
let doubled = original.map({value in value * 2})
doubled

27 * 37 //351
4.5 * 8.1 //
max(2,7,7,99)
min(2,7,7,99)
String(4)
//"abr" * "des" //　コンパイルエラー

let ba = true // true
let bf = false // false
let bfb = !ba // false

let bba = false && false // false
let bbb = false && true  // false
let bbc = true && false  // false
let bbd = true && true   // true

let bbe = false || false // false
let bbf = false || true  // true
let bbg = true || false  // true
let bbh = true || true   // true

let inta = 123 // Int型
let doublea = 1.0 // Double型
type(of:inta)
type(of:doublea)


let int8min = Int8.min
let int8max = Int8.max

let int16min = Int16.min
let int16max = Int16.max

let aq:Double = 12345678.9
let bq:Float = 12345678.9


typealias CLLocationDegress = Double
let awq:Double = 1.0/0.0
awq.isInfinite

let bwq:Double = Double.infinity
bwq.isInfinite

let cwq:Double = 0.0/0.0
cwq.isNaN

let dwq:Double = Double.nan
dwq.isNaN

let intaw:Int = 123
//let intb:Int64 = intaw コンパイルエラー
let intcw:Float = 123
//let intdw:Double = intcw コンパイルエラー

let intew:Int = 999
let intf:Int64 = Int64(intew)
let intgw:Float = 1.0
let inthw:Double = Double(intgw)
123 == 456
123 != 456
123 >= 456
123 > 456
123 <= 456
123 < 456

let comfloat:Float = 123
let comdouble:Double = 123

// コンパイルエラー comfloat == comdouble
comfloat == Float(comdouble)

// 加算
1+1//2
//減算
5-2//3
//乗算
2*4//8
//除算
9/3//3
//除算
7%3//1

let atashiInt:Int = 123
let atashiFloat:Float = 123.0
//　コンパイルエラー atashiInt + atashiFloat
atashiInt + Int(atashiFloat)

import Foundation
sin(Float.pi / 2)//1
log(1.0)

let result = 7+9
let output = "結果:\(result)"
let result2 = "優勝"
let output2 = "結果:\(result2)"

let haiku = """
  五月雨を
    あつめて早し
  最上川 TEST // コメントアウトも表示される
"""
print(haiku)

let Iinit = 123
let Sinit = String(Iinit)

let s1 = "123"
let i1 = Int(s1)

let s2 = "abc"
let i2 = Int(s2)


let string1 = "abc"
let string2 = "def"

string1 == string2 // false

var string3 = string1 + string2

string3.append(string2)

let options = String.CompareOptions.caseInsensitive
let order = "abc".compare("ABC",options:options)
order == ComparisonResult.orderedSame // true

// 文字列の検索
"abc".range(of:"bc") // 1から2の範囲を示す値
