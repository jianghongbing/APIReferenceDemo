//: Playground - noun: a place where people can play

import UIKit
//控制循环
//1. for...in:用于遍历集合中的元素和区间
//遍历区间
for i in 1 ..< 5 {
    print("i = \(i)")
}
//遍历集合
for city in ["beijing", "shanghai", "guangzhou", "wuhan"] {
    print(city)
}

//2.while 和 repeat while语句
//2.1 while循环
var number = 0
var sum = 0
while number < 100 {
    sum += number
    number += 1
}
print(number, sum)
//2.2 repeat while.如同C中的do-while
number = 0
sum = 0
repeat {
    sum += number
    number += 2
} while number < 100

print(number, sum)

//3.if else
let a = 100, b = 200
if a > b {
    print("a > b")
}else {
    print("a <= b")
}

//4.switch,在Swift中,Swift匹配的值不仅可以是数字类型,还可以是其他类型
let city = "wuhan"
switch city {
case "wuhan":
    print("武汉")
case "shanghai":
    print("上海")
case "beijing":
    print("北京")
default:
    print("其他城市")
}
//多个值的匹配
let char: Character = "a"
//switch char {
//case "( ⊙ o ⊙ )啊！":
//    <#code#>
//default:
//    <#code#>
//}







