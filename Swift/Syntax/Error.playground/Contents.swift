//: Playground - noun: a place where people can play

import UIKit
//错误处理:响应错误以及从错误中回复的过程,Swift提供了在运行时对可恢复错误的抛出、捕获、传递等相关操作
//1.表示并抛出错误,错误用符合Error协议的类型的值来表示,使用throw关键字来抛出错误
//定义错误,枚举类型非常适合来构建错误类型,并通过关联值来提供错误的相关信息
enum TestError: Error{
    case errorOne(String, Int)
    case errorTwo(String, Int)
    case errorThree(String, Int)
}
//抛出错误
//throw TestError.errorOne("错误1", 1001)

//2.错误处理:错误被抛出时,必须对其处理,否则会产生编译错误
//定义可抛出错误的函数,通过可抛出错误的函数来传递错误

enum AgeError: Error {
    case invalidAge(String)
    case nonage(String)
    case tooOld(String)
}


func validateInfo(age: Int) throws -> Int {
    if age < 0 {
        throw AgeError.invalidAge("无效的年龄")
    }else if age < 18 {
        throw AgeError.nonage("未成年")
    }else if age > 80 {
        throw AgeError.tooOld("年龄偏大")
    }
    return age
}
//Swift中提供处理错误的方式有4中
//2.1 使用do-catch语句来进行捕获,和java中异常处理方式类似,但是Swift中不需要强制去捕获异常
//当异常发生时,do语句块中try语句后面的代码将不会的得到执行,会去执行捕获到的异常语句快中
var age = 0
do {
    try age = validateInfo(age: 5)
    print("age:\(age)")
} catch AgeError.invalidAge(let errorInfo) {
    print("errorInfo:\(errorInfo)")
} catch AgeError.nonage(let errorInfo) {
    print("errorInfo:\(errorInfo)")
} catch AgeError.tooOld(let errorInfo) {
    print("errorInfo:\(errorInfo)")
}

//2.2 向上传递错误
func inputYourAge(age: Int) throws {
    try validateInfo(age: age)
}
do {
    try inputYourAge(age: 85)
} catch AgeError.invalidAge(let errorInfo) {
    print("errorInfo:\(errorInfo)")
} catch AgeError.nonage(let errorInfo) {
    print("errorInfo:\(errorInfo)")
} catch AgeError.tooOld(let errorInfo) {
    print("errorInfo:\(errorInfo)")
}
//2.3 通过可选值来处理错误:使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil
//如果发生没有发生错误,age将为下面函数的返回值
if let age = try? validateInfo(age: 15) {
    print("age:\(age)")
}
//2.4 禁用错误传递: 如果自己知道该可抛出错误的函数在特定条件下不会抛出错误,可使用try!来禁止抛出错误
let myAge = try! validateInfo(age: 20)
//age = try! validateInfo(age: 1) //如果不确定是否会发生错误,不建议使用这种方式来处理错误

//3.指定清理操作,在发生异常后,需要做一些清理操作,常见的如打开文件,在读取或写入数据到文件的过程中发生异常,在处理异常后,需要关闭文件,避免资源浪费
//defer语句:延迟处理,defer语句会在当前作用域块中最后执行
func deferTest() -> Int {
    defer {
        print("defer test")
    }
    print("test")
    return Int(arc4random_uniform(100));
//    defer {
//        print("defer2 test")
//    }
}
let random = deferTest()

//使用defer语句来做清理操作
//模拟读取文件操作
enum FileError: Error {
    case notFoundFileError(String)
    case readFileError(String)
}
class File {
    let path: String
    init?(path: String) throws {
        guard path.count > 0 else {
            throw FileError.notFoundFileError("文件不存在")
        }
        self.path = path
    }
    func readFile(offset: Int) throws -> Int {
        guard offset > 0 else {
            throw FileError.readFileError("读取文件错误")
        }
        return 1
    }

    func close() {
        print("关闭file")
    }
}

func readFile(path:String, offset: Int) {
    var file: File?
    var readFileSuccess = 0
    defer {
        file?.close()
    }
    do {
        try file = File(path: path)
        readFileSuccess = try file!.readFile(offset: offset)
        print("读取文件成功")
    } catch FileError.notFoundFileError(let errorInfo) {
        print("errorInfo:\(errorInfo)")
    } catch FileError.readFileError(let errorInfo) {
        print("errorInfo:\(errorInfo)")
    } catch {
        print(error)
    }
}
readFile(path: "", offset: 10)
readFile(path: "123.txt", offset: 10)
readFile(path: "123.txt", offset: -10)

