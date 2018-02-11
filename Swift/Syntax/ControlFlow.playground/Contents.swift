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
//swift中,不是必须要每个case的语句后面加上break语句,跳出循环,swift运行完case后面的语句自动跳出switch语句,默认的情况下每个case后面必须有执行语句,如果没有编译器后报错,此时可以加上break语句来避免错误
let city = "wuhan"
switch city {
case "wuhan":
    print("武汉")
case "shanghai":
    print("上海")
case "beijing":
    break
default:
    print("其他城市")
}
//多个值的匹配
let char: Character = "a"
switch char {
case "a", "b", "c":
    print("a 或 b 或 c")
default:
    break;
}

//区间的匹配
let scrore = 70.0
switch scrore {
case 0 ..< 60:
    print("不及格")
case 60 ..< 80:
    print("及格")
case 80 ..< 100:
    print("优秀")
case 100:
    print("满分")
default:
    print("无效的分数")
}
//由于每个case后面必须带有执行的语句,所有在swift中switch语句不存在像C语言中那样的贯穿,如果需要实现C中的贯穿,可以使用fallthough来实现,也可以通过多个值匹配的形式实现(最好使用这种方式)
switch city {
case "wuhan":
    fallthrough
case "shenzhen":
    fallthrough
case "shanghai":
    print("南方城市")
case "beijing":
    print("北方城市")
default:
    break
}
//5.continue, break语句,和C中的用法基本一致
//continue:跳出本次循环
//break:跳出整个循环
number = 100
sum = 0
while number > 0 {
    if number % 2 != 0 {
        number -= 1
        continue
    }else if number == 50 {
        break
    }
    sum += number
    number -= 1
}
print(number, sum)
var loopCount = 0
//6.标签语句
//break + 标签语句: 结束该语句
//continue + 标签语句:跳过标签语句的循环
outterLoop: for i in 1 ..< 10 {
    innerLoop: for n in 1 ..< 10 {
        if i == 5 && n == 8 {
            break outterLoop
        }else if n == 9 {
            continue outterLoop
        }
        loopCount += 1
    }
}
print(loopCount)
//7.guard语句:当条件通过时,不执行else中的语句,执行else块后面的语句,当条件不满足时,执行else语句块中的代码,else块后面的代码不会执行
func guardTest(number: Int) {
    guard number > 10 else {
        print("invalid number")
        return
    }
    print("vaild number")
}

guardTest(number: 5)
guardTest(number: 15)

//8.检查API的可用性
if #available(iOS 8, macOS 10, tvOS 3, *) {
    print("只有在你的设备,达到或超过上面的版本时,里面的代码会被执行")
}
