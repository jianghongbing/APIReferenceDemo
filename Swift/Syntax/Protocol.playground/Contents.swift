//: Playground - noun: a place where people can play

import UIKit
//协议:用于定义属性和方法的声明,实现交给遵守该协议的类,结构体,枚举去实现
//1.协议的声明
protocol Info {
    static var type: String { get } //定义只读类型属性
    var age: Int { set get } //定义可读写属性
    var firstName: String { set get}
    var secondName: String {set get }
    var fullName: String { get } //定义只读属性
    func logInfo() //定义方法
    static func logType() //定义类型方法
}

//遵守协议
class Person: Info {
    static var type: String{
        return "Person"
    }
    static func logType() {
        print(type)
    }
    var age: Int
    var firstName: String
    var secondName: String
    var fullName: String {
        return firstName + secondName
    }
    init(firstName: String, secondName: String, age: Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.age = age
    }
    func logInfo() {
        print("name:\(self.fullName), age: \(self.age)")
    }
}

//2.mutating方法在协议中的声明
protocol Square {
    mutating func squere() -> Double
}

extension Double: Square {
    mutating func squere() -> Double {
        self *= self
        return self
    }
}
var a = 5.4
a.squere()
print(a)

//3.协议中的构造器:协议中的构造器如果被类遵守,默认都为必须构造器,该类及其子类都必须实现该构造器,并且在该构造器前面加上required关键字,final类不用加required关键字,因为final没有子类
protocol InitProtocol {
    init(userId: String)
    var userId: String { set get }
}

class User: InitProtocol {
    var userId: String
    required init(userId: String) {
        self.userId = userId
    }
}

class VIPUser: User {
    var VIPLever: Int
    required init(userId: String) {
        self.VIPLever = 0
        super.init(userId: userId)
    }
}

final class Boss: InitProtocol{
    var userId: String
    init(userId: String) {
        self.userId = userId
    }
}

//4.通过扩展来遵循协议
enum ShapeType: String {
    case rectangle = "长方形"
    case square = "正方形"
    case circle = "圆"
}

protocol ShapeProtocol {
    static var shapeType: ShapeType { get }
    func area() -> Double
}

struct Rectangle{
    var width: Double
    var height: Double
}

//通过扩展遵守协议
extension Rectangle: ShapeProtocol {
    static var shapeType: ShapeType {
        return .rectangle
    }
    func area() -> Double {
        return width * height
    }

}

struct Circle {
    var radius: Double
}

extension Circle: ShapeProtocol {
    static var shapeType: ShapeType {
        return .circle
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }
}

//5.协议类型的集合:将协议作为类型使用
let shapeArray: [ShapeProtocol] = [Rectangle(width: 10, height: 5.0), Circle(radius: 7.5)]
shapeArray.forEach { shape in
    print(shape.area())
}
//6.类类型协议:只能够被类遵守,枚举,结构体不能遵守
protocol ClassProtocol: class {

}
//extension Circle: ClassProtocol {
//
//}
//7.协议的继承: 一个protocol继承另外一个protocol
protocol SquareProtocol: ShapeProtocol {
    var sideLength: Double {set get}
}

struct SquareShape: SquareProtocol {
    var sideLength: Double
    func area() -> Double {
        return pow(sideLength, 2)
    }
    static var shapeType: ShapeType {
        return .square
    }
}
//8.协议合成: 类,结构体,枚举都可以遵守多个协议,将协议名之间用&符号链接起来,称为协议合成
protocol AProtocol {
    func logA()
}
protocol BProtocol {
    func logB()
}
protocol CProtocol {
    func logC()
}
struct StructProtocolComposition: AProtocol, BProtocol, CProtocol {
    func logA() {
        print("a")
    }
    func logB() {
        print("b")
    }
    func logC() {
        print("c")
    }
}
class ClassProtocolComposition: AProtocol, BProtocol, CProtocol {
    func logA() {
        print("AA")
    }
    func logB() {
        print("BB")
    }
    func logC() {
        print("CC")
    }
}

//协议合成
var composition: [AProtocol & BProtocol & CProtocol] = []
//composition.append(5)
composition.append(StructProtocolComposition())
composition.append(ClassProtocolComposition())
composition.forEach {
    $0.logA()
    $0.logB()
    $0.logC()
}

//9.检查协议的一致性

