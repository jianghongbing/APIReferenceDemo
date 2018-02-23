//: Playground - noun: a place where people can play

import UIKit
//结构体:使用Struct关键来声明结构体
struct Point {
    var x = 0.0
    var y = 0.0

    init(x: Double) {
        self.x = x
    }

    init(y: Double) {
        self.y = y
    }

    init() {
        x = 0
        y = 0
    }

}

extension Point: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Point:x = \(x), y = \(y)"
    }
}

struct Size {
    var width = 0.0
    var height = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
}
//1.当结构体内部没有提供构造器时,系统会为该结构体提供一个逐一成员变量构造器
let pointA = Point(x: 10)
let size = Size(width: 10, height: 10)
let rect = Rect(origin: Point(y: 10), size: Size(width: 100, height: 100))
//2.结构体是值类型,Swift中的基本数据类型也都是使用结构体来实现的
let zero = Point()
var point = zero
point.x = 100
point.y = 100
print(zero, point)
