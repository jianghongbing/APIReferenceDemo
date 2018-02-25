//: Playground - noun: a place where people can play

import UIKit
//类,结构体,枚举都可以定义属性,属性一般用于存储值,分为实例属性和类型属性
//实例属性:每一个实例都有自己单独的一份属性列表,用于存储实例属性
//类型属性:类,结构体,枚举类型本身的属性,和实例无关
//1.储存属性:单纯的用于为实例存储值
struct Point {
    var x: Double
    var y: Double
}
let point = Point(x: 5.0, y: 6.0)

//struct Rectangle {
//    var width: Double
//    var lenght: Double
//}
//2.计算属性:不是像存储属性那样直接存储值,而是提供一个getter方法来获取值,提供一个可选的setter方法来设置与该属性关联的值,当没有提供setter的时候,该属性为只读计算属性
struct ScoreReport {
    var chineseScore: Double
    var mathScore: Double
    var totalScore: Double {
        get {
            return chineseScore + mathScore
        }
        set {
            chineseScore = newValue - mathScore
        }
    }
}

struct UserName {
    var firstName: String
    var secondName: String
    var name: String {
        return firstName + secondName
    }
}
var userName = UserName(firstName: "jiang", secondName: "hongbing")
print(userName.name)
//userName.name = "hehe" //只读计算属性的值不能被修改
var myScoreReport = ScoreReport(chineseScore: 60, mathScore: 80)
print(myScoreReport.totalScore)
myScoreReport.totalScore = 150
print(myScoreReport.chineseScore, myScoreReport.mathScore)
//3.属性观察器:可以在属性状态改变前和改变后的状态
class Person {
    init(id: String, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    let id: String
    var name: String {
        willSet(newName) {
            print("将要设置name属性的值:\(newName)")
        }

        didSet(oldName) {
            print("已经设置好name属性的值,name属性原来的值为:\(oldName)")
        }
    }
    //如果没有设置属性观察器的参数,willSet可以使用默认参数名称newValue, didSet可以使用默认参数名称newValue
    var age: Int {
        willSet {
            print("将要将age属性的值为:\(newValue)")
        }

        didSet {
            print("已经设置好age熟悉的值,age:\(age), age原来的值:\(oldValue)")
        }
    }
}

let person = Person(id: "001", name: "xiaoming", age: 10) //在构造的过程中,不会触发属性观察器
person.name = "daming"
person.name = "daming"
person.age = 10

//4.类型属性:使用static关键来申明类型属性,类型属性使用类来访问,不能通过实例访问
class ClassPropertyTest {
    static var classPropertyOne = "test"
    static var classPropertyTwo: String {
        set {

        }

        get {
            return self.classPropertyTwo + "classPropertyTest"
        }
    }
    static var classPropertyThree = 0 {
        willSet {
            print("将要设置新值:\(newValue)")
        }

        didSet {
            print("原来的值为:\(oldValue)")
        }
    }
}
ClassPropertyTest.classPropertyOne = "classPropertyOne"
ClassPropertyTest.classPropertyTwo = "classPropertyTwo"
ClassPropertyTest.classPropertyThree = 3

//5.延迟存储属性:在第一次使用该属性的时候,才会计算该属性的值,使用lazy关键字来声明延迟存储属性.可能属性的值在对象实例化之后才能确定,“常量属性在构造过程完成之前必须要有初始值,所以lazy属性必须声明为var变量
//class LazyPropertyTest {
//    lazy var area = self.width * self.height
//    var width = 0
//    var height = 0
//}

enum Shape {
    case rectangle(width: Double, height: Double)
    case circle(radius: Double)
    func shapeArea() -> Double {
        var area = 0.0
        switch self {
        case .rectangle(let width, let height):
            area = width * height
        case .circle(let radius):
            area = Double.pi * radius * radius
        }
        return area
    }
}


class Rectangle {
    var width = 0.0
    var height = 0.0
    lazy var shapeType = Shape.rectangle(width: self.width, height: self.height)
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}
let rectangle = Rectangle(width: 10.0, height: 5.0)
rectangle.shapeType.shapeArea() //在第一次使用该属性的时候,才去计算该属性的值
