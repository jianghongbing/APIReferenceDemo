//: Playground - noun: a place where people can play

import UIKit
//继承:只有类支持继承,结构体和枚举是不支持继承的
//可以重写继承而来的属性,方法,下标,重写的关键字override
enum UserType {
    case teacher
    case student
    case staff
    case unknown
}

class Person {
    var name: String
    var age: Int
    var userType: UserType {
        return .unknown
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func work() {
        print("do nothing")
    }
    func getInfo() -> String {
        return "name is \(name), age is \(age)"
    }
}
class Student: Person {
    let studentId: String
    //重写属性
    override var userType: UserType {
        return .student
    }

    override var name: String {
        willSet {
            print("will set name")
        }
        didSet {
            print("did set name")
        }
    }

    init(name: String, age: Int, studentId: String) {
        self.studentId = studentId
        super.init(name: name, age: age)
    }
    override convenience init(name: String, age: Int) {
        self.init(name: name, age: age, studentId: "")
    }

    //重写方法
    override func work() {
        print("go to school")
    }

    override func getInfo() -> String {
        let superInfo = super.getInfo()
        return superInfo + "student id is \(studentId)"
    }
}
let xiaoming = Student(name: "xiaoming", age: 12, studentId: "001")
xiaoming.work()
print(xiaoming.getInfo())
print(xiaoming.userType)
xiaoming.name
xiaoming.name = "daming"

//final
//防止重写:使用final修饰的属性,方法,下标,不能被重写
//使用final修饰的类不能被继承
class Shape {

}

class Rectangle: Shape {
    final var width: Double
    final var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init()
    }
    final func area() -> Double {
        return width * height
    }
}

final class Square: Rectangle {
//    override var width: Double {
//        willSet {
//
//        }
//        didSet {
//
//        }
//    }
    override init(width: Double, height: Double) {
        super.init(width: width, height: height)
        self.height = height
    }
//    override func area() -> Double {
//        return width * width
//    }
}



