//: Playground - noun: a place where people can play

import UIKit
//Swift中的数字类型
//1.整型:在32位系统中等同于Int32,在64位系统中等同于Int64,自动根据处理器的架构来确定整型的长度
let age = 10
//1.1 获取整型的最大值和最小值
let intMax = Int.max
let intMin = Int.min

//1.2 其他整型 Int8, Int16,UInt8等,使用方式和Int类似,只是在内存中所占据的字节数不同,因此它们的大小范围也不相同
let int8: Int8 = 14
let int16: Int16 = 16


//2.双精度浮点型Double:双进度类型的大小为64位.如果没有显示指明浮点数的类型,系统默认会自动推断为Double类型
let weight = 70.5 //隐式声明一个Double类型的常量,自动推断为double类型,而不是float类型
let height: Double = 170.50
//3.单精度浮点型:如果需要申明一个Float类型的数,需要显示申明
let distance: Float = 100.5
//4.浮点类型数的一些操作
//4.1四舍五入
var testValue = 1.56
var roundedValue = testValue.rounded()
testValue.rounded() //对自己做四舍五入,自己的值会变为四舍五入后的值

var testValueTwo = 2.5
roundedValue = testValueTwo.rounded(.awayFromZero) //去最近的那个大于或者等于自己的整数作为最后的结果
roundedValue = testValueTwo.rounded(.down) //向下取整,相当于C中的floor函数的功能
roundedValue = testValueTwo.rounded(.up) //想上取整,想当于C中的ceil函数的功能
roundedValue = testValueTwo.rounded(.toNearestOrAwayFromZero)//取离自己最近且被允许范围内的整数作为最后的结果,如果到某两个数的距离相等,去较大的那个.eg:2.5到2和到3的距离相等,结果为3
roundedValue = testValueTwo.rounded(.toNearestOrEven)//取离自己最近且被允许范围内的整数作为最后的结果,如果到某两个数的距离相等,去为偶数的那个 eg:2.5,结果为2, 3.5结果为4
roundedValue = testValueTwo.rounded(.towardZero) //去最近的那个小于或等于自己的整数作为最后的结果

//testValueTwo.round(.awayFromZero) //同rounded一样,只不过将最后的结果做为自己
//4.1其他的操作
let nan = Double.nan; //not a number
let infinity = Double.infinity //无穷大
let pi = Double.pi //圆周率
let isZero = 0.0.isZero
let isNan = nan.isNaN
let isEqual = 5.0.isEqual(to: 4.0) //等同于 5.0 == 4.0
let isInfinity = pi.isInfinite //是不是一个无穷大的数
let isFinity = pi.isFinite //是不是一个有限数
let squreRoot = 25.0.squareRoot() //平方根
let absValue = (-1.0).magnitude //绝对值
//5浮点数之间的比较 ==等于, >大于,>=大于或等于, <小于,<=小于或者等于,比较和其他语言差不多
//6.数字类型之间的四则运算:由于Swift是强语言类型,为了确保类型的安全,不同类型之间不能进行四则运算,在进行四则运算之前,必须将他们转换成相同的类型,四则运算和其他语言中基本一致






