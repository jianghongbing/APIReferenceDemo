//: Playground - noun: a place where people can play

import UIKit
//Set:没有重复元素,无序的集合
//1.Set的构建
//如果通过字面构建,因为编译器默认推断为Array类型,所以需要显示申明变量为Set类型
let cities:Set = ["wuhan", "shanghai", "beijing", "shenzhen"]
var numbers = Set<Int>() //构建一个空的set,此时必须确定set中元素的类型
numbers = Set([1, 1, 3, 4, 5, 6, 7])
//2.Set的检查
cities.isEmpty //判断set是否为空
cities.count //获取set中元素的个数
cities.capacity //set的容量
cities.first //第一个元素,Set是无序的,所以这并不表示顺序上的第一个元素
cities.contains("wuhan") //是否包含某个元素
//3.添加元素
numbers.insert(2) //插入元素
numbers.update(with: 8) //无条件的插入元素,并且返回该元素之前在Set中的值,如果该元素之前不在Set中,返回nil,如果在就返回该值
numbers.reserveCapacity(numbers.count) //分配指定的内存来存储Set中的元素
//4.移除元素
//过滤不符合条件的元素,返回符合条件的元素重新组成的Set
let filterNumbers = numbers.filter { (value) -> Bool in
    return value > 5
}
print(filterNumbers)
//numbers.remove(5) //移除某个元素
//numbers.removeFirst()//移除第一个元素
//numbers.removeAll()
//numbers.removeAll(keepingCapacity: true) //移除所有元素,不清除容量

//5.index
let startIndex = numbers.startIndex
let endIndex = numbers.endIndex
numbers[startIndex] //通过下标获取Set中的元素
numbers[numbers.index(after: startIndex)]
//numbers[endIndex] //不同通过endIndex来获取值,因为endIndex大于最后一个有效的index
//6.Set元素的查找
//是否包含符合条件的元素,一旦发现就停止查找
let isContains = numbers.contains { (number) -> Bool in
    return number > 5
}
//查找出第一个符合条件的值,一旦发现就停止查找
let first = numbers.first { (number) -> Bool in
    return number > 5
}
//找出符合条件的index
var index = numbers.index(of: 2)
index = numbers.index(where: { (number) -> Bool in
    number > 5 && number < 8
})

let min = numbers.min() //最小值
let max = numbers.max() //最大值

//以某个条件来作为判断,获取其中的最小值
let predicateMin = numbers.min { (numberOne, numberTwo) -> Bool in
    return numberOne > numberTwo
}

let predicateMax = numbers.max { (numberOne, numberTwo) -> Bool in
    return numberOne > numberTwo
}

//7.Set的转换
//转换Set中的元素,并且返回转换的值所组成的数组
let map = numbers.map { (number) -> Int in
    return number + 5
}
let sum = numbers.reduce(0) { (result, number) -> Int in
    return result + number
}
//返回一个排序后数组
var sortedArray = numbers.sorted() //升序排列
//按照某种提交进行排序
sortedArray = numbers.sorted(by: { (numberOne, numberTwo) -> Bool in
    return numberOne > numberTwo
})

//8.Set的遍历
for number in numbers {
    print(number)
}

for (index, number) in numbers.enumerated() {
    print(index, number)
}
numbers.forEach {
    print($0)
}

//9.Set的比较
let numbersOne:Set = [1, 3, 2, 9, 0]
let numbersTwo:Set = [2, 5, 8, 4, 7, 3, 6]
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbersOne == numbersTwo
numbersTwo != numbersOne
numbersOne.isSubset(of: numbers) //是不是某个set的子集
numbersTwo.isStrictSuperset(of: numbers)
numbers.isStrictSubset(of: numbers) //是否为某个set的绝对子集,set并不是该set本身的绝对子集
numbers.isSuperset(of: numbersTwo) //是否为某个set的父集
numbers.isStrictSuperset(of: numbersOne) //是否为某个set的绝对父集
numbers.isStrictSuperset(of: numbers) //自己不是自己的绝对父集
numbersOne.isDisjoint(with: numbersTwo) //判断两个set之间是否没有交集,即两个集合中没有相同的元素
//10.Set的操作
//并集
numbersOne.union(numbersTwo)
var newNumbers = Set(3 ..< 8)
//将另外一个集合中的元素插入到一个可变的集合中
newNumbers.formUnion(numbersOne)
//交集
numbersOne.intersection(numbersTwo)
//移除非set之间的交集的元素,相当于将并集赋值个newNumbers
newNumbers.formIntersection(numbersOne)
//并集减去交集,也就是不是在两个set都存在的元素所组成的新的集合
numbersOne.symmetricDifference(numbersTwo)
//并集减去交集的结果赋值个newNumbers
newNumbers.formSymmetricDifference(numbersTwo)
//移除某个集合的所有元素,如果元素不在当前集合中,则忽略
numbers.subtract(numbersOne)
//移除某个集合的所有元素,将其结果返回
numbersOne.subtracting(numbersTwo)

//11.Set和NSSet之间的转化,通过as关键字来进行转化,将NSSet转换成Set,会转换成Set<NSObject>类型
let nsSet: NSSet = [1, 3, 5, 6 ,8]
let set = nsSet as Set
print(set)
let convertSet = numbers as NSSet
print(convertSet)





