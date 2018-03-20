//: Playground - noun: a place where people can play

import UIKit
//Extendsion:扩展,为类,结构体,枚举扩展新的功能,如添加计算熟悉,下边,类型方法,实例方法等,通过关键字extension来扩展类,枚举,结构体
//1.添加计算型属性


struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
}

extension Rect {
    //添加实例计算属性
    var center: Point {
        return Point(x: x + width * 0.5, y: y + height * 0.5)
    }

    static var shape: Shape {
        return .rectangle
    }
    //2.添加方法
    //添加类型方法
    static func logShape() {
        print(shape)
    }
    //添加实例方法
    func area() -> Double {
        return width * height
    }
    //3.扩展构造器,类类型之能扩展便利构造器
    init(origin: Point, size: Size) {
        self.init(x: origin.x, y: origin.y, width: size.width, height: size.height)
    }
    //5.扩展嵌套类型
    enum Shape {
        case circle, trangle, rectangle, square, other
    }
}

let rect = Rect(origin: Point(x: 10, y: 10), size: Size(width: 100.0, height: 100.0))
print(rect.area())
print(Rect.logShape())
print(rect.center)

class User {
    var name: String = ""
    let id: String
    var age = 0
    init(id: String) {
        self.id = id
    }
}
//为类类型扩展便利构造器
extension User {
    convenience init(id: String, name: String, age: Int) {
        self.init(id: id)
        self.name = name
        self.age = age
    }
    //4.扩展下标
    subscript (valueForPropertyName: String) -> String? {
        set {
            if valueForPropertyName == "name" {
                self.name = newValue!
            }else if valueForPropertyName == "age" {
                self.age = Int(newValue!)!
            }
        }

        get {
            guard valueForPropertyName == "id" else{
                guard valueForPropertyName == "name" else {
                    guard valueForPropertyName == "age" else {
                        return nil
                    }
                    return String(age)
                }
                return name
            }
            return id
        }
    }
}
protocol LoginService {
    func login()
    func loginout()
}
//6.通过扩展,让类型遵循协议
extension User: LoginService {
    func login() {
        print("name:\(name), id:\(id) login")
    }

    func loginout() {
        print("name:\(name), id:\(id) loginout")
    }
}

//7.扩展协议
//7.1:通过扩展协议,为协议中的方法提供默认实现
protocol UserInfo {
    func getId() -> String
    func logUserInfo()
}

protocol UserDetailInfo: UserInfo {
    func getName() -> String
    func getAge() -> Int
}

extension UserInfo {
    func logUserInfo() {
        print("userId:\(getId())")
    }
}

extension UserDetailInfo {
    func logUserInfo() {
        print("userId:\(getId()), userName:\(getName()), userAge:\(getAge())")
    }
}

extension User: UserDetailInfo {
    func getId() -> String {
        return id
    }

    func getName() -> String {
         return name
    }
    func getAge() -> Int {
        return age
    }
}

let xiaoming = User(id: "001", name: "xiaoming", age: 10)
xiaoming.logUserInfo()
xiaoming.login()
xiaoming.loginout()


//7.2:通过扩展协议,为符合条件的类型提供默认实现
protocol Animatable {
    func duration() -> Double
    func startAnimatino()
    func endAnimation()
}

protocol AnimationTiming {
    var duration: Double { set get }
    var beginTime: Double { set get }
}

extension Animatable where Self: AnimationTiming {
    func duration() -> Double {
        return duration
    }
}

struct Circle: AnimationTiming{
    var r = 0.0
    var center = Point(x: 0, y: 0)
    var duration = 0.25
    var beginTime = 0.0
    init(radius: Double, center: Point) {
        r = radius
        self.center = center
    }
}

extension Circle: Animatable {
    func startAnimatino() {
        print("start animation")
    }
    func endAnimation() {
        print("end animtion")
    }
}
