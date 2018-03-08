//: Playground - noun: a place where people can play

import UIKit
//嵌套类型,某一个类型中再定义其他类型
struct Rect {
    struct Point {
        var x: Double
        var y: Double
    }
    struct Size {
        var width: Double
        var height: Double
    }
    var x = 0.0
    var y = 0.0
    var width = 0.0
    var height = 0.0
    init(origin: Point, size: Size) {
        x = origin.x
        y = origin.y
        width = size.width
        height = size.height
    }
}
//引用嵌套类型
let origin = Rect.Point(x: 10, y: 10)
let size = Rect.Size(width: 100, height: 100)
let rect = Rect(origin: origin, size: size)

class User {
    enum UserType: String{
        case teacher = "Teacher"
        case student = "Student"
    }
    var name: String
    var userId: String
    let userType: UserType

    init(name: String, userId: String, userType: UserType) {
        self.name = name
        self.userId = userId
        self.userType = userType
    }
}

let userType = User.UserType.student
let user = User(name: "xiaoming", userId: "001", userType: userType)
let type = user.userType.rawValue

