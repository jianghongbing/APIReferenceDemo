//: Playground - noun: a place where people can play

import UIKit
//析构器:析构器只适用用类中,在对象回收之前,析构器会立即调用,每个类只有一个析构器,如果Objective-C中的dealloc
class Object {
    let id: String
    let name: String
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    deinit {
        print("release object:\(name), id:\(id)")
    }
}
func logObjectInfo(obj: Object) {
    print("object name:\(obj.name), id:\(obj.id)")
}

logObjectInfo(obj: Object(id: "001", name: "apple"))
let block = {
    _ = Object(id: "002", name: "banana")
}
block()


