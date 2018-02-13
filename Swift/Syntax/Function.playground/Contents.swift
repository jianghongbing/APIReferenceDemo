//: Playground - noun: a place where people can play

import UIKit
//函数
//1.函数的声明和调用

//声明一个无参数,无返回值的函数
func test() {
    print("this is a function, no parameters, no return value")
}
//声明一个带有参数,有返回值的参数,->表示该函数需要返回值
func sumTwoInt(a: Int, b: Int) -> Int {
    return a + b
}
//函数的调用
test()
var result = sumTwoInt(a: 5, b: 6)
print(result)
//2.函数的参数
//参数标签和参数名称,参数标签在调用函数的时候使用,参数名称在函数内部使用,默认情况下,使用参数名称作为函数的参数标签
//当参数没有参数标签时,会使用参数名作为该参数的标签,也就是说参数标签和参数名称一样的
func subTwoInt(a: Int, b: Int) -> Int{
    return a - b
}
//指定参数标签:参数标签在参数名称的前面,在下面的函数中,numberA为参数标签,a为参数名称
func multiplicationTwoInt(numberA a: Int, numberB b:Int) -> Int {
    return a * b
}
result = multiplicationTwoInt(numberA: 5, numberB: 6)
//忽略参数标签,当在调用函数时,不需要使用参数标签的时候,可以使用_来忽略参数标签
func addTwoNumber(_ a: Int, b:Int) -> Int {
    return a + b
}
//调用参数的时候,忽略参数标签
result = addTwoNumber(5, b: 6)

//参数的默认值,可以为参数提供一个默认的值,一般讲带有默认值的参数放在参数的后面
func addTwoInt(a: Int, b: Int = 0) -> Int {
    return a + b
}
result = addTwoInt(a: 5)
result = addTwoInt(a: 5, b: 6)
//可变参数:使用...表示该参数的个数是不确定的,在内部将其作为使用数组来处理
func addNumbers(initValue: Int = 0, numbers:Int ...) -> Int {
//    var result = initValue
//    for number in numbers {
//        result += number
//    }
//        return result
   return numbers.reduce(initValue) { (result, number) -> Int in
        return result + number
    }
}
result = addNumbers(initValue: 10, numbers: 1, 2, 3, 4, 5, 6, 7, 8, 9)
//输入输出参数:一般情况下,函数的参数都作为常量来处理,即在函数体中不能修改参数的值,而输入输出参数是可以被修改的,使用inout修饰,inout的参数的类型必须为可变类型,输入输出参数不能有默认值,并且不能为可变参数
func swapTwoInt(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var a = 5, b = 6
swap(&a, &b)
print(a, b)

//函数类型:函数的参数个数和类型以及返回值类型决定了函数的类型
//addTwoInt和multiplicationTwoInt的类型是一样的
var funcA:(Int, Int) -> Int = addTwoInt(a:b:)
result = funcA(5, 8)
funcA = multiplicationTwoInt(numberA:numberB:)
result = funcA(5, 8)
//函数类型作为函数的参数
func oprationTwoNumber(numberA: Int, numberB: Int, method:(Int, Int) -> Int) -> Int {
    return method(numberA, numberB)
}

result = oprationTwoNumber(numberA: 5, numberB: 10, method: funcA)
//函数类型作为返回值
func returnFunction(char: Character) -> (Int, Int) -> Int {
    switch char {
    case "+":
        return addTwoInt(a:b:)
    case "-":
        return subTwoInt(a:b:)
    case "*":
        return multiplicationTwoInt(numberA:numberB:)
    default:
        return addTwoInt(a:b:)
    }
}
let funcB = returnFunction(char: "-")
result = funcB(10, 20)
//内嵌函数:函数里面再定义函数
func nestedFunction(char: Character) -> (Int, Int) -> Int {
    func functionOne(a: Int, b: Int) -> Int {
        return a + b
    }
    func functionTwo(a: Int, b: Int) -> Int {
        return a - b
    }
    func functionThree(a: Int, b: Int) -> Int {
        return a * b
    }
    func functionFour(a: Int, b: Int) -> Int {
        return a / b
    }
    var returnFunction = functionOne
    switch char {
    case "+":
        break
    case "-":
        returnFunction = functionTwo(a:b:)
    case "*":
        returnFunction = functionThree(a:b:)
    case "/":
        returnFunction = functionFour(a:b:)
    default:
        break
    }

    return returnFunction
}

let funcC = nestedFunction(char: "/")
result = funcC(10, 3)


