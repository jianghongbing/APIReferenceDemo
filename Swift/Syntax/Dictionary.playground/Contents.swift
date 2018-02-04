//: Playground - noun: a place where people can play

import UIKit
//Dictionary:以键值对储存数据的集合,无序的,每一个key必须是唯一的
//1.Dictionary的构建
let cities = ["wh": "武汉", "bj": "北京", "sh": "上海"]  //字面量构建
let numbers = Dictionary(uniqueKeysWithValues: [("one", 1), ("two", 2), ("three", 3)]) //keysWithValues构建
//2.Dictionary常用到的属性
let count = cities.count //键值对的数量
let isEmpty = cities.isEmpty //是否为空
let capacity = cities.capacity //容量
//3.访问Dictionary中的key和value
//通过key访问value,因为对应的key可能在字典中不存在,所以通过下标访问dictionary中的值返回的是一个可选类型的值
let wuhan = cities["wh"]
let shenzhen = cities["sz", default: "深圳"] //如果指定的key不存在,就给一个默认的值
let beijing = cities["bj", default: "beijing"]
let first = cities.first //返回第一个键值对,这里的first并不表示该键值对在Dictionary中就是第一个出现的
//let keys = cities.keys //字典中所有的键
//let values = cities.values //字典中所有的values
//4.Dictionary的遍历
for keyValue in cities {
    print(keyValue)
    print(keyValue.key, keyValue.value)
}
cities.forEach { (key, value) in
    print(key, value)
}

for (index,keyValue) in cities.enumerated() {
    print(index, keyValue)
}
let underestimatedCount = cities.underestimatedCount //A value less than or equal to the number of elements in the collection.

//5.Dictionary的比较,只支持是否相等性的比较,而且只支持元素类型相同的Dictionary之间的比较,键值对的数量是否相等,然后key和value一一进行比较, cities和nunbers之间是不能比较的
cities == ["wh": "武汉", "sh": "上海", "bj": "北京"]
numbers != ["one": 1, "two": 2]
//6.查找字典中的元素
//Dictionary是否包含某个符合闭包中条件的键值对
let isCoantains = cities.contains { (key, value) -> Bool in
    return key == "wh" && value == "wuhan"
}
print(isCoantains)

//查找出符合条件的第一个键值对
if let firstElement = cities.first(where: { (key, value) -> Bool in
    return value == "武汉"
}) {
    print(firstElement)
}

//7.index
let startIndex = cities.startIndex
let endIndex = cities.endIndex
cities[startIndex] //获取某一个位置的键值对
let index = cities.index { (key, value) -> Bool in
    key >= "s"
}
print(index ?? "")

//8.transform Dictionary
//mapValue:以当前dictionary中的key和转变之后的value组成新的字典
let mapValues = cities.mapValues { (value) -> String in
    return value + "市"
}
print(mapValues)
//reduce:
let cityString = cities.reduce("cities中的城市有:") { (result, keyValue) -> String
    in
//    var punctuation = ""
//    if let index = cities.index(forKey: keyValue.key), index.cou == cities.endIndex {
//        punctuation = "."
//    }else {
//        punctuation = ","
//    }
//    return result + keyValue.value + punctuation
    return result + keyValue.value + ","
}
print(cityString)
//map:返回由每个key value形变后的值所组成的数组
var cityArray = cities.map { (key, value) -> String in
    return key + value
}
print(cityArray)
//flatMap:闭包返回的结果是一个可选值,由返回的非nil的值组成的数组,如果该可选值为nil,不会出现在返回的数组里面,
cityArray = cities.flatMap({ (key, value) -> String? in
    return key > "s" ? key + value : nil
})
print(cityArray)
//sort:对以键值对的元组组成的一个数组按照闭包中返回的结果进行排序
let soredCityArray = cities.sorted { (keyValueOne, keyValueTwo) -> Bool in
    return keyValueOne.key < keyValueTwo.key
}
print(soredCityArray)
//9.更新字典中的值
var cityDictionary = cities
cityDictionary["wh"] = "wuhan" //修改字典中的值,如果不存在指定的key,将该键值对添加到Dictionary中去
cityDictionary["sz"] = "深圳"
cityDictionary["bj"] = nil //如果将某个key的设置为nil,如果该key存在,则将其移除掉,如果不存在则忽略
cityDictionary["nj"] = nil
for keyValue in cityDictionary {
    print(keyValue.key, keyValue.value)
}

//updateValue:替换指定Key的值,并且返回该key原来的值
let updateValue = cityDictionary.updateValue("武汉", forKey: "wh")
//merge:合并两个dictionary,Dictionary元素的类型必须相同才能合并
//闭包接收两个参数:如果被合并的Dictionary中有和当前字典中相同的key时,闭包的第一个参数表示当前key在字典中的value,另外一个参数表示被合并的字典中的key的值
cityDictionary.merge(["bj": "北京", "wh": "wuhan"]) { (currentValue, _) -> String in
    return currentValue
}

cityDictionary.merge(["sh": "shanghai", "wh": "武汉"]) { (_, newValue) -> String in
    return newValue
}
//分配足够的大小储存字典中的元素
cityDictionary.reserveCapacity(cityDictionary.count)
//filter:过滤掉不符合条件的键值对,返回符合条件的键值对重新组成的新的字典
let filterDictionary = cityDictionary.filter { (key, value) -> Bool in
    return value.count > 3
}
//10.remove
cityDictionary.removeValue(forKey: "wh") //移除掉指定键的值
cityDictionary.removeValue(forKey: "123")
cityDictionary.remove(at: cityDictionary.startIndex) //移除某个位置的键值对
cityDictionary.removeAll() //移除所有的元素,清空cityDicitionary的容量
cityDictionary.removeAll(keepingCapacity: true) //移除所有的元素,但是保存字典的容量

//11.Dictionary和NSDictionary之间的转换, 通过as关键字来进行转换
let nsDictionary:NSDictionary = ["xm": "xiaoming", "dm": "daming", "lm": "laoming"]
let dictionary = nsDictionary as Dictionary
print(dictionary)
let newNSDictionary = dictionary as NSDictionary
print(newNSDictionary)

var mutableDictionary = nsDictionary as Dictionary
mutableDictionary.updateValue("ximi" as AnyObject, forKey: "xm" as NSObject)
print(mutableDictionary)





