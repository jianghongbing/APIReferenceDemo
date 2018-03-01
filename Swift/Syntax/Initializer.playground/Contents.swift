//: Playground - noun: a place where people can play

import UIKit
//构造过程是类,结构体,枚举的实例之前的准备过程,在新实例使用之前必须经过该过程,具体操作包括设置存储属性的初始值和执行其他必须的设置或初始化工作
//1.存储属性的初始值:在实例的创建课程中,存储属性必须有值,“存储型属性的值不能处于一个未知的状态
//默认属性值:在属性声明的时候赋值
class Animal {
    var name: String
    var age = 0
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
//可选属性类型,在声明可选类型的时候,如果没有给定默认属性值,可选类型的属性的值自动为nil
//常量属性,在类的构造过程中,可以在常量属性声明的时候赋值,或者在构造器中赋值,一般构造过程完成,常量属性的值将不能被修改
class User {
    var name: String?
    let userId: String
    init(userId: String) {
        self.userId = userId
    }
}
let xiaoming = User(userId: "001")
//xiaoming.userId = "002"
xiaoming.name = "xiaoming"

//2.默认构造器:当类或者结构体的属性在声明的时候都赋值了,同时没有自定义的构造器,Swift会为这些结构体或类提供一个默认构造器,这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例
struct Point {
    var x = 0.0
    var y = 0.0
}
class Cell {
    var cellIdentifier = "com.jianghongbing.cell"
    var cellHeight = 44.0
}
let zero = Point()
let cell = Cell()
//结构体的逐一成员变量构造器:当结构体没有自定义构造器,结构会自动获得一个逐一成员变量构造器,无论该结构体中所有的属性是否都有默认值
let point = Point(x: 10.0, y: 20.0)
//3.构造代理
//结构体的构造代理
struct Size {
    var width: Double
    var height: Double
    init(width: Double) {
        self.init(width: width, height: 0)
    }

    init(height: Double) {
        self.init(width: 0.0, height: height)
    }

    init(width: Double, height: Double) {
        self.width = width
        self.height = height;
    }
}
//类的构造代理和类的继承
//Swift为类提供了两种构造器,指定构造器和便利构造器,便利构造器通过convenience来申明
//类的构造规则:指定构造器总是向上代理,便利构造器总是横向代理
//1.指定构造器必须调用父类的指定构造器
//2.便利构造器必须调用同类中的其他构造器
//3.便利构造器必须最终导致一个指定构造器被调用
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
//    var age: Int
//    let id: String
//    init(name: String, age: Int, id: String) {
//        self.name = name
//        self.age = age
//        self.id = id
//    }
}

class Student: Person {
    let studentId: String
    var classTeacherName: String = ""
    var grade = 0
//    override convenience init(name: String) {
//        self.init(name: name, studentId: "001", classTeacherName: "", grade: 0)
//    }


//    init(studentId: String) {
//        self.init(name: "", studentId: studentId, classTeacherName: "", grade: 0)
//    }

    init(name:String, studentId: String, classTeacherName: String, grade: Int) {
        self.studentId = studentId
        self.classTeacherName = classTeacherName
        self.grade = grade
        super.init(name: name)
    }
    convenience init(name: String, studentId: String, classTeacherName: String) {
        self.init(name: name, studentId: studentId, classTeacherName: classTeacherName, grade: 0)
    }

    convenience init(name: String, studentId:String) {
        self.init(name: name, studentId: studentId, classTeacherName: "")
    }
}

let daming = Student(name: "daming", studentId: "002")

//4.可失败的构造器:创建一个可选类型的实例,如果构建失败,实例为nil,表示没有值
class Product: CustomStringConvertible {
    let id: String
    var name: String
    init?(id: String, name: String) {
        guard id.count >= 10 else {
            return nil
        }
        self.id = id
        self.name = name
    }
    var description: String {
        return "product name: \(name), id:\(id)"
    }

}
if let product = Product(id: "1234", name: "apple") {
    print(product)
}else {
    print("product is nil")
}
if let product = Product(id: "1234567890", name: "apple") {
    print(product)
}else {
    print("product is nil")
}
//枚举的可选失败构造器
//带有原始值的默认的可失败构造器:当枚举带有原始值,Swift会自动提供一个init?(rawValue:)的可失败构造器
enum Direction: String {
    case east = "E"
    case west = "W"
    case sourth = "S"
    case north = "N"
    init?(char: Character) {
        switch char {
        case "E", "e":
            self = .east
        case "W", "w":
            self = .west
        case "S", "s":
            self = .sourth
        case "N", "n":
            self = .north
        default:
            return nil
        }
    }
}
if let direction = Direction(char: "c") {
    print(direction)
}else {
    print("direction is nil")
}
if let direction = Direction(char: "E") {
    print(direction)
}else {
    print("direction is nil")
}
if let direction = Direction(rawValue: "W") {
    print(direction)
}else {
    print("direction is nil")
}
//构造失败的传递:类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行
class IPhone: Product {
    let uuid: String
    init?(id: String, name: String, uuid: String) {
        self.uuid = uuid
        super.init(id: id, name: name)
        //一旦构建失败,后面的代码将不会执行
        print("id:\(id)")
    }
}
if let iPhone = IPhone(id: "iPhone", name: "iPhoneX", uuid: "234fasdfas") {
    print(iPhone)
}else {
    print("iPhone is nil")
}
if let iPhone = IPhone(id: "Apple-iPhone", name: "iPhoneX", uuid: "234fasdfas") {
    print(iPhone)
}else {
    print("iPhone is nil")
}
//必要构造器:只能在类中声明必要构造器,在结构体和枚举不能声明,在init前面加上required关键字来声明必要构造器,继承的子类必须要重写必要构造器
class Vehicle {
    var numberOfWheel: Int
    var name: String
    required init(name: String, numberOfWheel: Int) {
        self.name = name
        self.numberOfWheel = numberOfWheel
    }
}
class Car: Vehicle {
    var engine: String
    required init(name: String, numberOfWheel: Int) {
        self.engine = "unknown"
        super.init(name: name, numberOfWheel: numberOfWheel)
    }
    init(name: String, numberOfWheel: Int, engine: String) {
        self.engine = engine
        super.init(name: name, numberOfWheel: numberOfWheel)
    }
}

//通过闭包或者函数来设置属性的默认值
//注意:在闭包执行时,实例还没有完成初始化,所以在闭包中不能使用self来访问其他的属性或者方法,可以通过延迟属性可以避免该问题
class View: UIView {
    let redView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    let blueView: UIView = {
        let view = UIView(frame: CGRect(x: 200, y: 10, width: 100, height: 100))
        view.backgroundColor = .blue
        return view
    }()

    lazy var orangeView: UIView = {
        print(self.redView, self.blueView)
        let view = UIView(frame: CGRect(x: 200, y: 150, width: 100, height: 100))
        view.backgroundColor = .orange
        return view
    }()
}
let view = View()
view.orangeView

