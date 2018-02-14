//: Playground - noun: a place where people can play

import UIKit
//闭包,没有名字的函数
let cities = ["wuhan", "beijing", "shanghai"];
//1.闭包的语法:{(参数)->返回值 in 闭包体部分}
var sortedCities = cities.sorted(by:{ (cityOne: String, cityTwo: String) -> Bool in
    return cityOne > cityTwo
})
//闭包可以根据上下文自动推断参数的类型,因此上面的排序的闭包中,可以省略闭包中参数的类型,也可以省去包裹参数的括号
sortedCities = cities.sorted(by: { cityOne, cityTwo -> Bool in
    return cityOne > cityTwo
})
//闭包可以根据上下文推断返回值的类型,因此可以省略闭包的返回值类型
sortedCities = cities.sorted(by: { (cityOne, cityTwo) in
    return cityOne > cityTwo
})
//单行表达式的隐式返回:如果闭包体中只有一行表达式,可以使用该表达式的结果作为闭包的返回值,可以省略return关键字
sortedCities = cities.sorted(by: { cityOne, cityTwo in
    cityOne > cityTwo
})
//参数名称缩写:如果在闭包中使用参数缩写,可以省略掉参数列表和in关键字
sortedCities = cities.sorted(by: {$0 > $1})
print(sortedCities)
//运算符方法,在String类型中,定义了>,<等相关运算符,而且该运算符也是接收两个String的参数,因此在上面的方法中可以使用运算符方法
sortedCities = cities.sorted(by: >)
//尾随闭包,当闭包作为函数的最后一个参数时,可以使用尾随闭包,来增强代码的可读性
//尾随闭包的写法:将参数写在括号中,尾随闭包直接用大括号包裹起来
//当只有一个闭包作为函数的参数时,可以省去参数的括号
sortedCities = cities.sorted() { cityOne, cityTwo in cityOne > cityTwo}
print(sortedCities)
sortedCities = cities.sorted { $0 > $1 }

//2.闭包的值捕获:闭包可以捕获上下文的常量和变量,当这些常量或变量的原作用域不存在,在闭包中依然可以去访问它或者修改
func captureClosure(number: Int) -> (() -> Int){
    var sum = 0
//    func addNumber() -> Int {
//        sum += number
//        return sum
//    }
//
//    return addNumber
    return {
        sum += number
        return sum
    }
}

let captureClosureTest = captureClosure(number: 10)
var result = captureClosureTest()
result = captureClosureTest()
result = captureClosureTest()
//闭包是值引用类型
let captureCloseureTestTwo = captureClosureTest
result = captureCloseureTestTwo() //还是使用之前闭包中的sum值
//当闭包中捕获到了也是值引用的对象,而该值引用的对象也持有该闭包,会产生循环引用导致内存泄露,放在后面学习
//3.逃逸闭包:当一个闭包作为参数传入到函数中,而希望在函数返回之后执行的闭包,称之为逃逸闭包
var escapeClosure:((Int) -> Void)? = nil
func escapeClosureTest(number: Int, closure: @escaping (Int) -> Void) {
    print(number)
    escapeClosure = closure
}

escapeClosureTest(number: 5) { print($0) }
if let closure = escapeClosure {
    closure(10)
}

//4.自动闭包:自动创建的闭包,用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包
let autoClosure = { () -> Int in
    let a = 5
    let b = 6
    return a + b
}
let autoClosureValue = autoClosure()
//自动闭包作为函数的参数:使用关键@autoClosure来声明表示该闭包是自动闭包,而在调用函数的时候,只需要闯入指定的字符串即可,而闭包需要返回的值,就是使用你传入的字符串的值
func autoClosureTest(a: String, closure: @autoclosure () -> String) {
    let result = closure()
    print(result + "," + a)
}
autoClosureTest(a: "jianghongbing", closure: "hello")
//自动 && 逃逸闭包,需要同时将该闭包声明为@autoclosure和@escaping,使用是上面两者的结合
