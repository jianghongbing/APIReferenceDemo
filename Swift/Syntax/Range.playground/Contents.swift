//: Playground - noun: a place where people can play

import UIKit
//Range:定义一个半开区间(包含最小值,不包含最大值)
//1.Range的初始化
let range = 1 ..< 10; //从1开始(包含1)到10(不包含10)
let letterRange = "a" ..< "z"
let doubleRange = 1.0 ..< 10.0
//2.range是否为空,和包含某个值
let emptyRange = 1.0 ..< 1.0  //两端的值是一样的区间为空区间
//let isEmpty = range.isEmpty
let isEmpty = emptyRange.isEmpty
//let isContains = doubleRange.contains(2.56)
var isContains = letterRange.contains("b")
isContains = doubleRange ~= 2.5 //同上面的contains的作用一样,判断某个值是否在区间中
//3.range的边界两端的值
let lowerBound = range.lowerBound
let upperBound = range.upperBound
//4.range的比较,只有类型一致的range才能互相比较,否则编译器会报错误
let anotherRange = 5 ..< 15
let isEqual = range == anotherRange
let isNotEqual = range != anotherRange
//5.range的交集,如果有交集,值就为它们的交集,如果没有,返回的结果为一个空集,开始和结束的值都为比较的range的和自己距离最近的那个值
var clampedRange = range.clamped(to: anotherRange)
let rangeOne = 20 ..< 100
clampedRange = range.clamped(to: rangeOne)
//6.overlap:判断两个range之间是否有重叠的部分,即相同的元素
var isOverlap = range.overlaps(anotherRange)
isOverlap = range.overlaps(rangeOne)
//7.countedableRange:可遍历的range,可以通过for循环来遍历range
for i in range {
    print("i = \(i)")
}
//CloseRange:闭区间,包含两端的值,API和range的基本一致
let closeRange = 0 ... 10
for n in closeRange {
    print("n = \(n)")
}




