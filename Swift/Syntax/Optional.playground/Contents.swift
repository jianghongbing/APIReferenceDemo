//: Playground - noun: a place where people can play

import UIKit
//1.可选类型:表示值可能缺失的情况,如果有值则为该值,如果没有值,就表示没有值,用nil表示,和Objective-C中的nil不一样,在Objective-C中,不存在没有值的概念,nil表示一个不合法的对象,只能作用于NSObject类型,不能作用于基本类型和结构体类型,在Swift中,类,结构体,枚举都可以使用nil来一个可选值,其没有指向到任何对象或者变量
//可选类型变量的声明,如果没有给可选类型变量赋值,其表示没有值,用nil表示
var number: Int? //没有值,为nil
number = 5 //值为5
var stringToNumber = Int("23") //值为23
stringToNumber = Int("abc") //没有值,为nil
//判断可选类型变量是否有值和强制解析
//强制解析:通过在可选类型变量后面加上一个!来表示强制解析,如果变量不存在值,强制解析会产生运行时错误导致程序终止,所以在不确定可选变量是否有值的情况下,不要使用强制解析
if number != nil {
    print("number:\(number!)")
}else {
    print("number is nil");
}
//可选绑定:判断可选类型变量是否有值,如果有值就将值赋值给其他变量,可选绑定用于if和while语句中,作为条件,如果不存在值,条件为false
if let binding = number {
    print("number:\(binding)")
}else {
    print("number is nil");
}

//2.可选链式调用:在一个可选类型变量或者常量上使用属性,方法,下标,如果可选类型有值,调用就会成功,如果没有值,则返回nil,多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil
//多层可选链式调用:可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标,多层可选链式调用不会增加返回值的可选层级
//多层可选链式调用规则:
//2.1.如果你访问的值不是可选的，可选链式调用将会返回可选值。
//2.2如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选",实际上还是一个可选值,通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用,类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
struct Point {
    var x: Double
    var y: Double
}

struct Size {
    var width: Double
    var height: Double
    init?(width: Double, height: Double) {
        guard width >= 0 && height >= 0 else {
            return nil
        }
        self.width = width
        self.height = height
    }
}

struct Rect {
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    var origin: Point {
        return Point(x: x, y: y)
    }
    var size: Size? {
        return Size(width: width, height: height)
    }

    func area() -> Double? {
        guard width >= 0 && height >= 0 else {
            return nil
        }
        return width * height
    }

    func logRectInfo() {
        print("x:\(x), y:\(y), width:\(width), height:\(height)")
    }


}
let aRect:Rect? = Rect(x: 10, y: 10, width: 100, height: 100);
if let point = aRect?.origin {
    print("x:\(point.x), y:\(point.y)")
}else {
    print("point is nil")
}

if aRect?.logRectInfo() != nil {
    print("can log rect info")
}else {
    print("can not log rect info")
}


let bRect = Rect(x: 10, y: 10, width: -10, height: 9)
if let area = bRect.area() {
    print(area)
}else {
    print("area is nil")
}
//多个可选绑定同时使用
if let width = bRect.size?.width, let height = bRect.size?.height {
    print(width, height)
}
