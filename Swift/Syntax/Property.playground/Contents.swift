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
//3.属性观察器
