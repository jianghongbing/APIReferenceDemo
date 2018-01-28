//: Playground - noun: a place where people can play

import UIKit
//String: 由一个或者多个字符组成的有序集合
//1.字符串的构造
let wuhan = "wuhan" //字面量构造
// 通过构造方法来构造字符串
let charArray:[Character] = ["w", "u", "h", "a", "n"]
let cityName = String(charArray)
//构造多个重复的字符串组成新的字符串
let repeatString = String(repeating: "wuhan", count: 5)
//通过格式化来构建字符串
let formatString = String(format:"name is %@, age is %ld", "xiaoming", 12)

//2.多行字符串的构造,使用""""""或者在字符串中间插入换行符来构造
let multiLineString = """
first line
second line
third line
"""
let secondMultiLineString = "first line\nsecond line\nthird line"
print(multiLineString, secondMultiLineString)
//3.通过+,+=来拼接字符串
let firstName = "John"
let secondName = "Smith"
let fullName = firstName + secondName
var name = firstName
name += secondName
//4.字符串的插值法
let age = 10;
name = "xiaoming"
let xiaomingInfo = "name is \(name), age is \(age)"
//5.字符串常用的属性
let isEmpty = xiaomingInfo.isEmpty //判断字符串是否为空
let count = firstName.count //判断字符的个数
let upperString = wuhan.uppercased() //转换成大写
let lowerString = upperString.lowercased() //转换成小写
let appleURL = "https://www.apple.com"
appleURL.hasPrefix("https") //是否包含某个前缀
appleURL.hasSuffix("com") //是否包含某个后缀

//6.字符串中的字符的遍历和枚举器
//let charactView = wuhan.
for char in wuhan {
    print(char)
}

wuhan.forEach { char in
    print(char)
}
let greeting = "你好, Swift"
let enumeratedSequence = greeting.enumerated() //字符的位置和字符组成一对
enumeratedSequence.forEach { (index, char) in
    print("index:\(index), char: \(char)")
}
//var iterator = greeting.makeIterator() //迭代器
//while iterator.next() != nil {
//    print(iterator.next() ?? "迭代完成")
//}
let underestimatedCount = greeting.underestimatedCount
//7.字符串中的Unicode的呈现形式
let utf8 = greeting.utf8 //字符串以UTF8编码的形式所呈现的码点的集合,即每一个码点的范围为0~127
let utf16 = greeting.utf16 //字符串以UTF16编码的形式所呈现的码点的集合 0~2^16-1
let unicodeScalarView = greeting.unicodeScalars //字符串以Unicode标量编码的形式所呈现的码点的集合 0~2^21-1
for utf8CodePoint in utf8 {
    print(utf8CodePoint)
}

for utf16CodePoint in utf16 {
    print(utf16CodePoint)
}
for unicodeScalar in unicodeScalarView {
    print(unicodeScalar, unicodeScalar.value)
}

//6.字符串的拼接
var string = "test"
string.append("A")
string.append("abc")
var appendString = string.appending("hehehe")
appendString = string.appendingFormat("append age is %ld", 15)
print(string, appendString)
//appendString.reserveCapacity(10) //使用指定的储存空间来储存字符串,如果大小小于字符串需要的最小空间,则使用该字符串需要的最少的空间

//7.字符串的index, 字符在字符串中的位置
string = "test"
let startIndex = string.startIndex
let endIndex = string.endIndex;
let beforeIndex = string.index(before: endIndex)
let afterIndex = string.index(after: startIndex)
let distanceIndex = string.index(startIndex, offsetBy: 1)
let indexDistance = string.distance(from: startIndex, to: endIndex)

//7.字符串的插入
string.insert("好", at: startIndex)
string.insert(contentsOf: "haha", at: endIndex)
//7.字符串的移除, 如果移除的index,超过了字符串的最后一个字符的index,会产生运行时错误
string.remove(at: startIndex) //移除指定位置的字符
string.removeLast() //移除第一个字符
string.removeFirst() //移除最后一个字符
string.removeSubrange(string.startIndex ..< string.index(string.startIndex, offsetBy: 2)) //移除指定范围的字符
string.removeLast(2) //移除后两个字符
string.removeFirst(2) //移除前两个字符
string.removeAll() //移除所有的字符
string = "testtestAAAbbbscd"
var subString = string.dropFirst() //移除第一个字符,并返回移除第一个字符后的字符串
subString = string.dropFirst(2) //移除前几个字符,并且返回移除后的字符串
subString = string.dropLast()
subString = string.dropLast(3)
//通过闭包的形式来移除某个字符
subString = string.drop(while: { (char) -> Bool in
    return char == "t"
})
print(subString)

//字符串过滤,过滤所有某个出现的字符
let filterString = string.filter({ (char) -> Bool in
    return char != "b"
})
print(filterString)
//8.SubString:Swift为了优化字符串的性能,使用一个SubString的类型,表示某一个字符串的子字符串,其指向的内存和父字符串共享相同字符的内存,来减小内存的分配,可以通过String的构造方法将subString转换成字符串,subString和字符串有着一样的接口
//通过range来获取subString
subString = string[string.startIndex ... string.index(string.startIndex, offsetBy: 5)]
subString = string.prefix(8) //获取字符的前8个字符的字符串
subString = string.prefix(through: string.index(string.startIndex, offsetBy: 3)) //获取字符串开始到自定位置的字符(包含最后位置)所组成的字符串
subString = string.prefix(upTo: string.index(string.startIndex, offsetBy: 3))  //获取字符串开始到自定位置的字符(不包含最后位置)所组成的字符串
//返回在某个字符之前的字符串
subString = string.prefix(while: { (char) -> Bool in
    return char == "c"
})
print(subString)
subString = string.suffix(10) //返回后10字符组成字符串
//subString = string.suffix(from: <#T##String.Index#>)
//subString转换成字符串
let convertString = String(subString)

//9.字符串的比较
let isEqual = "aA" == "Aa"
let isLessThan = "aA" < "Aa"
let isLessThanOrEqual = "abc" <= "aBC"
let isGreaterThan = "abc" > "aBC"
let isGreaterThanOrEqual = "abc" >= "ABC"

//10.字符相关方法
var isContains = "abc".contains("a")  //是否包含某个字符
isContains = "abc".contains(where: { (char) -> Bool in
    return char == "A"
})
print(isContains)
//根据提供的条件找出第一个匹配的字符
if let firstCharacter = "abc".first(where: { (char) -> Bool in
    return char == "b" || char == "B"
}) {
    print(firstCharacter)
}
//获取某个字符的index
let charIndex = "abcd".index(of: "d")
if charIndex == nil {
    print("not found")
} else {
    print(charIndex!)
}
//min max字符
string = "dfefwaw"
if let min = string.min(), let max = string.max() {
    print("min:\(min), max:\(max)")
}

let firstChar = string.first
let lastChar = string.last
let indexChar = string[string.index(string.startIndex, offsetBy: 2)] //通过下标获取某个位置的char
//11.sort
var characters = string.sorted() //升序排列
characters = string.sorted(by: { (charOne, charTwo) -> Bool in
    return charOne >= charTwo //按照指定的顺序排列
})
print(characters)
characters = string.reversed() //翻转
//12.高阶函数
//12.1 map函数,将string中的char,转换成其他的值,将对应的值的集合并将其返回
let hashValueArray = string.map({ (char) -> Int in
    return char.hashValue
})
print(hashValueArray)


//13.通过reduce函数翻转字符串
let reversedString = string.reduce("") { (x, y) -> String in
//    return x.appending(String(y))
    var string = x
    string.insert(y, at: string.endIndex)
    return string
}
print(reversedString)

//14.分片splite
let splitString = "wuhan, beijing, shanghai, shenzhen, chengdu, hanzhou"
var stringArray = splitString.split(separator: ",")
stringArray = splitString.split(separator: ",", maxSplits: 2) //最大分几片
stringArray = splitString.split(whereSeparator: { (char) -> Bool in
   return char == ","
})
print(stringArray)

//15. String和NSString之间的互换
var nsString:NSString = "hello, swift"
var swiftString = nsString as String
nsString = swiftString as NSString






