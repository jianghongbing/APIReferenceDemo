//: Playground - noun: a place where people can play

import UIKit
//ARC: Automatic Reference Counting,自动引用计数,Swift通过ARC来管理内存,ARC只针对类类型的实例,与Objective-C中的内存管理一致
//ARC的工作机制:当每次创建一个类的新的实例的时候，ARC会分配一块内存来储存该实例信息。内存中会包含实例的类型信息，以及这个实例所有相关的存储型属性的值。当实例不再被使用时，ARC释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的实例，不会一直占用内存空间。当ARC收回和释放了正在被使用中的实例，该实例的属性和方法将不能再被访问和调用。实际上，如果你试图访问这个实例，你的应用程序很可能会崩溃。为了确保使用中的实例不会被销毁，ARC会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。哪怕实例的引用数为1，ARC都不会销毁这个实例。无论你将实例赋值给属性、常量或变量，它们都会创建此实例的强引用,类实例在被ARC回收之前会调用deinit方法

//1.ARC的使用
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    func logPersonInfo() {
        print("name:\(name)")
    }
    deinit {
        print("Person:\(name) deinit")
    }
}

var dm:Person?
func testARC() {
    let daming = Person(name:"daming")
    daming.logPersonInfo()
    dm = daming


}

testARC() //作用于结束,daming被销毁,daming对实例的引用消失,此时还有dm对创建的实例的内存引用,所以不会调用deinit方法
dm = nil //dm设置为nil,dm对实例的引用消失,此时内存没有其他对象引用,因此释放该内存.会调用deinit方法
//2.ARC产生的循环引用以及解决方法
//2.1 对象之间的循环引用
//强引用:默认某个变量指向一个对象就为强引用,没有使用weak和unowned修饰的属性或者变量
//弱引用:使用weak修饰,和Objective-C中的的概念相同,弱引用不会持有该对象,当内存被回收时,弱引用会自动断开对该内存的引用,弱引用属性的值为nil,因此弱引用属性是一个可选类型
//无主引用:使用unowned修饰,与weak作用相同,但是无主引用可以修饰不是可选类型的值
//Swift中使用弱引用和无主引用来解决循环引用导致内存无法释放的问题
class Father: Person {
    weak var son: Son?
}

class Son: Person {
    var father: Father?
}

func referenceCycleForObjects() {
    let laowang = Father(name: "laowang")
    let xiaowang = Son(name: "xiaowang")
    laowang.son = xiaowang
    xiaowang.father = laowang
    //在该函数的作用域消失后,laowang和xiangwang会销毁,但是其指向的内存之间互相引用,导致内存无法释放
    //解决办法:将其中的一个对象持有另外一个对象的属性设置为weak弱引用,内存可以释放
}
referenceCycleForObjects()
//2.3 闭包产生的循环引用
class Student: Person {
    let studentNumber: Int
    init(name: String, studentNumber: Int) {
        self.studentNumber = studentNumber
        super.init(name: name)
    }
    //闭包中会引用自己本身,本身持有该closure,因此产生循环引用
    lazy var loginInfoBlock: () -> Void = {
        [unowned self] in
        print("studentName:\(self.name), studentNumber:\(self.studentNumber)")
    }
}
func referenceCycleForClosure() {
    let xiaoming = Student(name: "xiaoming", studentNumber: 1)
    xiaoming.loginInfoBlock()
}
referenceCycleForClosure()


















