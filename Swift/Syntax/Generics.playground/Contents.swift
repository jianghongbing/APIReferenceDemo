//: Playground - noun: a place where people can play

import UIKit
//泛型:泛型能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型。它能让你避免代码的重复，用一种清晰和抽象的方式来表达代码的意图

//1.泛型函数
//泛型参数类型放在参数表的括号的前面,T表示参数的类型
func swapTwoValues<T>(a: inout T,  b: inout T) {
    let temp = a
    a = b
    b = temp
}

var numberA = 10, numberB = 20
var stringA = "abc", stringB = "edg"
//swap(&numberA, &numberB)
swapTwoValues(a: &numberA, b: &numberB)
print(numberA, numberB)
swapTwoValues(a: &stringA, b: &stringB)
print(stringA, stringB)

//定义多个泛型参数的函数


//2.定义泛型类型
struct Stack<E> {
    var elements = [E]()
    mutating func pop() -> E?{
        return elements.count > 0 ? elements.removeLast() : nil
    }

    mutating func push(element: E) {
        elements.append(element)
    }
}

//泛型类型的使用
var intStack = Stack<Int>()
intStack.push(element: 5)
intStack.push(element: 10)
intStack.push(element: 20)
intStack.pop()
intStack.pop()

var stringStack = Stack<String>()
stringStack.push(element: "a")
stringStack.push(element: "b")
stringStack.push(element: "c")
stringStack.pop()
//扩展泛型
extension Stack {
    var last: E? {
        return elements.last
    }
    var first: E? {
        return elements.first
    }
}

intStack.first
intStack.last
stringStack.first
stringStack.last

//3.类型约束
//约束类型符合Comparable协议,如果要求符合多个协议,协议之间用&符号来链接
func twoValuesIsEqual<T: Comparable>(a: T, b: T) -> Bool {
    return a == b
}

twoValuesIsEqual(a: 10, b: 10)

//4.关联类型




