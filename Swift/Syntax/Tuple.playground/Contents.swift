//: Playground - noun: a place where people can play

import UIKit
//Tuple:元组,由多个值组成的一个符合值,每个值的类型可以不同
//1.定义一个元组
let tupleOne = ("jianghongbing", "Peter", 28)
//2.访问元组里面的值,通过值的顺序来访问对应的值
let name = tupleOne.0
let englishName = tupleOne.1
let age = tupleOne.2
//3.通过给定的key来拆解元组里面的值
let (myName, myEnglishName, myAge) = tupleOne
print(myName, myEnglishName, myAge)
//4.如果只需要元组其中一部分的值,不想要的值的那一部分可以使用_来替代
let (yourName, _, _) = tupleOne
print(yourName)
//5.元组的类型:上面的tupleOne的类型是(String, String, Int)类型

