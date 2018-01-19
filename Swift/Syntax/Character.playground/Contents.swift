//: Playground - noun: a place where people can play

import UIKit
//Unicode.Scalar:组成Unicode字符的最小单元
//Character:字符,有一个或者多个Unicode.Scalar组成,组成的一个可视化的单元
//1.字符的声明,字符字面量必须显示的声明,如果没有显示的声明,编译器默认会初始化成字符串
let a: Character = "a"
let chineseCharacter:Character = "中"
//2.字符的比较
let isEqual = a == chineseCharacter
let isGreaterThan = a > chineseCharacter
let isGreaterThanOrEqual = a >= chineseCharacter
let isLessThan = a < chineseCharacter
let isLessThanOrEqual = a <= chineseCharacter
let isNotEqual = a != chineseCharacter

//3 Unicode.Scalar
let aScalar: UnicodeScalar = "A" //字面量初始化
let airplane = Unicode.Scalar(9992) //通过scalar的值初始化
print(airplane ?? "")
var isASCII = airplane!.isASCII //判断该字符是否在ASCII表中
isASCII = aScalar.isASCII
var scalarValue = aScalar.value //获取UnicodeScalar的值
scalarValue = airplane!.value
//4.UnicodeScalarView: 相当于一个Character中的UnicodeScalar组成的集合
let unicodeScalarView = chineseCharacter.unicodeScalars


