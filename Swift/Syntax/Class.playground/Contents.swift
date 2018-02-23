//: Playground - noun: a place where people can play

import UIKit
//类:使用class关键字来声明一个自定义类
class Animal {
    var name = ""
    var age = 0
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct Cat {
    var name = ""
    var age = 0
}

//1.类是引用类型
let dog = Animal(name: "dahuang", age: 1)
var daHuang = dog
dog.name = "daHuang"
dog.age = 2
print(daHuang.name, daHuang.age)

//2.恒等运算符,只能在引用类型之间使用
//===:恒等于,表示两个变量指向同一个对象
//!==:不恒等于,表示两个变量不是指向一个相同的对象
//let cat = Cat(name: "xiaoxiao", age: 1)
if dog === daHuang {
    print("指向同一个对象")
}else {
    print("不是指向同一个对象")
}

daHuang = Animal(name: "dahuang", age: 1)
if dog === daHuang {
    print("指向同一个对象")
}else if dog !== daHuang {
    print("不是指向同一个对象")
}
