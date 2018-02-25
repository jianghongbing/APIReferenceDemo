//: Playground - noun: a place where people can play

import UIKit
//类,结构体,枚举中的方法,就是在类,结构体,枚举中定义函数
//方法:分为实例方法,类型方法
//1.实例方法:通过实例访问
//2.类型方法,使用static关键来申明,通过类型来访问
enum Shape {
    case rectangle
    case trangle
    case circle
}
struct Rectangle {
    var width: Double
    var height: Double
    func area() -> Double {
        return width * height
    }
    static func shapeType() -> Shape {
        return .rectangle
    }
}
let rectangle = Rectangle(width: 10, height: 5)
rectangle.area()
Rectangle.shapeType()

