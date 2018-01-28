//: Playground - noun: a place where people can play

import UIKit
//Array:元素的集合,有序的,可以重复的
//1.Array的构建
//字面量构建
let intArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//构建空数组,下面这两行代码的都是构建空数组,构建空数组必须指定数组元素的类型
//var emptyArray : [String] = []
var emptyArray = [String]()
//构建一个重复元素的数组
let repeatElementArray = Array(repeatElement("hello", count: 5))
//2.Array常用的属性
let isEmpty = emptyArray.isEmpty //判断某个元素是否为空
let count = intArray.count //数组中元素的个数
let capacity = intArray.capacity //数组的容量.大于或等于数组中元素的个数
//3.访问Array中的元素
let first = intArray.first //数组中的第一个元素
let last = intArray.last //数组中的最后一个元素
let indexElement = intArray[4]  //通过下标来访问数组中的元素
let subRangeArray = intArray[2 ..< 5] //获取某个range范围内的元素
//4.添加元素,let修饰的数组常量不能添加或移除元素
var cities = [String]()
//添加元素
cities.append("wuhan")
cities.append(contentsOf: ["beijing", "shanghai"]) //添加某一个集合到该数组的后面,该集合中的元素必须和数组中的元素类型相同,或者是其子类
//插入元素
cities.insert("shenzhen", at: 0)
cities.insert(contentsOf: ["guangzhou", "chengdu"], at: 2)
//替换元素
cities.replaceSubrange(0 ..< 2, with: ["chongqing", "wuhan"])
//使用指定的大小来储存数组
cities.reserveCapacity(cities.count)
//5.查找元素
let isContains = cities.contains("wuhan") //数组是否包含某个元素
//找出符合条件的第一个元素
let findFirst = cities.first {
    $0.contains("u")
}
findFirst

var index = cities.index(of: "chengdu") //元素的索引
//找出符合元素的索引
index = cities.index(where: {
    $0.hasPrefix("wu")
})
index
//元素中最大值和最小值
var min = cities.min()
var max = cities.max()
min = cities.min { $0.characters.count < $1.characters.count }
min
max = cities.max { $0.characters.count < $1.characters.count }
max

//6.子数组
//从前往后找子数组
var prefix = cities.prefix(2) //数组的元素的索引小于n的元素(不包含index为2的元素)组成的集合
prefix = cities.prefix(through: 2) //数组的元素的索引小于或等于n的元素(包含index为2的元素)组成的集合
prefix = cities.prefix(upTo: 3)  //数组的元素的索引小于n的元素的集合
prefix = cities.prefix { $0 >= "c" } //如果找到不符合条件的元素,就停止查找,忽略后面的元素,返回第一个不符合条件的前面的符合条件的元素的集合
print(prefix)
//从后往前找子数组
var suffix = cities.suffix(2) //后2个元素
suffix = cities.suffix(from: 2) //后n-2个元素

//7.drop,返回移除元素后的元素数组,
var dropElementArray = cities.dropFirst() //返回移除第一个元素后的数组
dropElementArray = cities.dropLast() //返回移除后最后一个元素后的数组
dropElementArray = cities.dropLast(2) //返回移除后2两个元素后的数组
dropElementArray = cities.dropFirst(2) //返回移除前2个元素后的数组
//8.数组的转变
//map函数,返回一个转变后的数组
let mapArray = cities.map {
    $0.characters.count
}
print(mapArray)
let reduceString = cities.reduce("") { $0 + $1 }
print(reduceString)

//9.枚举器
//数组的遍历
for city in cities {
    print(city)
}

cities.forEach {
    print($0)
}


for (index, city) in cities.enumerated() {
    print(index, city)
}

var iterator = cities.makeIterator()
while let next = iterator.next() {
    print(next)
}

//10.数组的排序
cities.sort()
cities.sort { $0.characters.count > $1.characters.count } //按照某种条件排序
cities.reverse() //翻转元素
cities.swapAt(0, 2) //交换某两个元素的位置

//11.join && splite
//将数组元素合并成一个字符串
let cityString = cities.joined(separator: ",")
//将字符串以某个分隔符,返回分割后的元素组成的数组
let cityArray = cities.split(separator: ",")
let nestedArray = [[1, 6, 4], [2, 5, 7]]
//如果数组中元素也有数组,返回内元素组成的数组
let joinedArray = nestedArray.joined()
for number in joinedArray {
    print(number)
}

//数组的比较
let a = [1, 2, 3, 4, 5]
let b = [1, 2, 4, 3, 5]
a == b //元素相同,顺序一致
a != b
a.elementsEqual(b) //元素相同,顺序一致








