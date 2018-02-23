//: Playground - noun: a place where people can play

import UIKit
//枚举:为一组相关的值定义了一个共同的类型
//1.枚举语法: enum + 枚举类型名称 + {枚举元素,以及其他的语句}
//多个成员值可以写在同一行上
enum Week {
    case sunday, monday, tuesday, wednesday, thursday, friday, staurday
//    case sunday
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//    case saturday
}
//使用枚举类型的值和使用其他类型的值是一样的
let weekday: Week = .monday

//2.原始值:在定义枚举的时候,如果需要枚举成员变量包含原始值,必须显示的确定枚举原始值的类型
enum Month: String {
    case january = "一月"
    case february = "二月"
    case march = "三月"
    case april = "四月"
    case may = "五月"
    case june = "六月"
    case july = "七月"
    case august = "八月"
    case september = "九月"
    case october = "十月"
    case november = "十一月"
    case december = "十二月"
}
//原始值的隐式赋值:在枚举的原始值为整型或者字符串的时候,不需要为每一个成员赋指定的原始值,他们自动获得一个默认的原始值
enum BasicNumber: Int {
    case zero, one, two, three, four, five, six, seven, eight, nine
}
//原始值构造器,当枚举有原始值的时候,编译器会提供一个原始值构造器给该枚举类型,因为枚举的成员有限,因此通过原始值构造器返回的值可能存在,也可能不存在,因此返回一个可选的枚举成员
let zero = BasicNumber(rawValue:0)
if let zero = zero {
    print(zero, zero.rawValue)
}

//3.关联值:可以为每个成员绑定关联值,关联值可以是任何类型
enum Direction {
    case east(Int)
    case west(Int)
    case south(Int)
    case north(Int)
    case northeast(Int, Int)
    case southeast(Int, Int)
    case northwest(Int, Int)
    case southwest(Int, Int)
}
let here = Direction.northeast(100, 50)
//4.枚举在Switch语句中的使用
switch here {
case .east(let offset):
    print("正东方,偏移的距离为:\(offset)米")
case .west(let offset):
    print("正西方,偏移的距离为:\(offset)米");
case .south(let offset):
    print("正南方,偏移的距离为:\(offset)米");
case .north(let offset):
    print("正北方,偏移的距离为:\(offset)米");
case .northeast(let eastOffset, let northOffset):
    print("东北方,东方偏移的距离为:\(eastOffset)米, 北方偏移的距离为:\(northOffset)米")
case .southeast(let eastOffset, let southOffset):
    print("东南方,东方偏移的距离为:\(eastOffset)米, 南方偏移的距离为:\(southOffset)米")
case .northwest(let westOffset, let northOffset):
    print("西北方,西方偏移的距离为:\(westOffset)米, 北方偏移的距离为:\(northOffset)米")
case .southwest(let eastOffset, let southOffset):
    print("西南方,西方偏移的距离为:\(eastOffset)米, 南方偏移的距离为:\(southOffset)米")
}


