//: Playground - noun: a place where people can play

import UIKit
//Subscript:下标,能向类,结构体,枚举提供一种能像数组,字典那样通过括号的方式来访问指定的元素,通过subscript关键字来声明一个下标,声明下标最少需要一个参数
class Routes {
    private var routes: [String: String] = [:]
    subscript (key: String) -> String? {
        get {
            return routes[key]
        }
        set(route){
            routes[key] = route
        }
    }
}

let routes = Routes()
//通过下标来设置值
routes["apple"] = "https://www.apple.com"
routes["google"] = "https://www.google.com"
//通过下标来获取值
if let route = routes["apple"] {
    print(route)
}
if let route = routes["baidu"] {
    print(route)
}else {
    print("no baidu route")
}

//下标没有提供setter时,该下标是只读的,称为只读下标
//可以通过下标的参数数量不同或者参数类型的不同来提供多个下标,此方法也称为下标的重载
class Info {
    private let id: String
    private var name: String
    private var age: Int
    init(id: String, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    subscript (propertyName: String) -> String? {
        if propertyName == "id" {
            return id
        }else if propertyName == "name" {
            return name
        }else if propertyName == "age" {
            return String(age)
        }
        return nil
    }

    subscript (propertyIndex: Int) -> String?{
        if propertyIndex == 0 {
            return id
        }else if propertyIndex == 1 {
            return name
        }else if propertyIndex == 2 {
            return String(age)
        }
        return nil
    }
}
let info = Info(id: "001", name: "xiaoming", age: 10)
let age = info["age"]
let name = info[1]

//多个参数的下标
struct Matrix {
//    private var numbers = [[Int]]()
    private var numbers = [Int]()
    let rows: Int
    let columns: Int
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        if columns > 0 && rows > 0 {
            for r in 0 ..< rows {
                for c in 0 ..< columns {
                    let element = r * columns + c
                    numbers.append(element)
                }
            }
        }
    }

    subscript (row row: Int, column column: Int) -> Int {
        get {
            if row >= self.rows || row < 0 || column >= self.columns || column < 0 {
                return 0
            }else {
                return numbers[row * self.columns + column]
            }
        }

        set {
            numbers[row * self.columns + column] = newValue
        }

    }
}
var matrix = Matrix(rows: 10, columns: 10)
let fifty = matrix[row:5, column:0]
matrix[row: 6, column: 0] = 500
let value = matrix[row: 6, column: 0]




