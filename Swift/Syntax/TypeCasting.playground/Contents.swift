//: Playground - noun: a place where people can play

import UIKit
//类型转化
//1.数字,字符串类型之间的转换
let a = 10, b = 5.0
//Swift的不同数字类型之间,不能做运算,而且Swift中也不会自动将某个类型转换到其他类型,如在C中,整型和浮点数之间的运算,默认会将整型转换为浮点数在计算,在Swift中,需要显式强制转换(通过构造器来转换)
let c = a + Int(b)
let d = Double(a) + b
let ageInfo = "age:" + String(a)
//2.类对象之间的转化
//通过is来判断某个实例对象是不是属于某个类型
//as?:将某个实例转换成具体的类型,返回一个可选类型的值,如果是指定的类型,则转换成功,否则为nil
//as!:将某个实例强制转换类型,如果是该类型转换成功,如果不是该类型,会抛出异常
class Vehicle {
    var name: String
    var brand: String
    init(name: String, brand: String) {
        self.name = name
        self.brand = brand
    }
}

class Car: Vehicle {
    var engine: String
    init(name: String, brand: String, engine: String) {
        self.engine = engine
        super.init(name: name, brand: brand)
    }
    func speedUp() {
        print("汽车加速")
    }
}

class Bicycle: Vehicle {

}
let vehicles = [Bicycle(name: "001", brand: "fenghuang"),Car(name: "002", brand: "bwm", engine: "bwm") , Bicycle(name: "003", brand: "jieante"), Car(name: "004", brand: "Benz", engine: "bz"), Car(name: "005", brand: "Toyota", engine: "Toyota")]
var bicycleCount = 0, carCount = 0
for vehicle in vehicles {
    if vehicle is Bicycle {
        bicycleCount += 1
    }else if vehicle is Car {
        carCount += 1
    }
}
bicycleCount
carCount
let vehicle = vehicles[1];
if let car = vehicle as? Car {
    car.speedUp()
}else {
    print("it not a car")
}

let benz = vehicles[3] as! Car
print(benz.name, benz.brand, benz.engine)

//3.Any和AnyObject
//Any: 表示任何类型,包括可选类型, AnyObject:表示类类型的实例
let info = ["xiaoming", 12, Car(name: "Crown", brand: "Toyota", engine: "Toyota")] as [Any]
info.forEach { obj in
    if obj is String {
        print("name:" + (obj as! String))
    }else if obj is Int {
        print("age:" + String(obj as! Int))
    }else if obj is Car {
        let car = obj as! Car
        print("car name:\(car.name), brand: \(car.brand)")
    }
}
//可以添加任何类型的值
var anyArray = [Any]()
anyArray.append("wuhan")
anyArray.append(1000)
anyArray.append(Vehicle(name: "Honda", brand: "HD"))


class Animal {
    var name = ""
    var age = 0
}

class Computer {
    var name = ""
    var cpuName = ""
}

//只能添加类实例的值
var anyObjects = [AnyObject]()
anyObjects.append(Animal())
anyObjects.append(Computer())
anyObjects.append(Vehicle(name: "001", brand: "dazhong"))

//Swift类型和Objective-C类型转化
//字符串之间的相互转化
let city = "wuhan"
let nsCity = city as NSString
let nsName: NSString = "xiaoming"
let name = nsName as String

//将Swift集合类型转换为对应的Objective-C集合类型,Objective-C集合中的元素类型都为Any
//将Objective-C集合类型转换为Swift集合类型,Swift集合中的元素的类型都为AnyObject
var numbers = [1, 101, 1001]
let nsNumbers = numbers as NSArray
let one = nsNumbers[0]
nsNumbers.adding("test")
let nsAnimals: NSArray = [Animal(), Animal()]
var animals = nsAnimals as Array
animals.append(Computer())


let nsStrings: NSArray = ["wuhan", "beijing"]
var strings = nsStrings as Array
//strings.append(5)

//let cities: NSArray = ["wuhan", "beijing"]


//let nsAnimals = animals as NSArray
//let animalOne = nsAnimals[0]

