//
//  main.m
//  NSObject
//
//  Created by pantosoft on 2018/4/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
#import "TestObjectOne.h"
#import "TestObjectTwo.h"
#import "TestObjectThree.h"
#import "TestObjectFour.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSObject:Objective-C所有类的基类(NSProxy例外)
        //1.类以及对象的生命周期相关方法
        //1.1 + (void)load方法: 当类装载到程序中,即使没有使用到该类,也会被调用,在整个程序的声明周期中只会被调用一次
        //1.2 + (void)initialize方法:第一次使用到该类的时候调用,如果子类没有实现该方法,会调用父类的initialize方法,因此如果有子类的情况下,并且子类没有重写initialize方法,该方法可能会被调用多次
        //1.3 init:对象初始化的时候调用
        //1.4 dealloc: 对象被回收的时候会调用
        
        {
//            TestObjectThree *testObjectThree = [[TestObjectThree alloc] init];
//            TestObjectFour *testObjectFour = [[TestObjectFour alloc] init];
            TestObject *testObjectOne = [[TestObject alloc] init];
            TestObject *testObjectTwo = [[TestObjectOne alloc] init];
            TestObjectThree *testObjectThree = [[TestObjectThree alloc] init];
            NSLog(@"testObjectOne:%@, testObjectTwo:%@, testObjectThree:%@", testObjectOne, testObjectTwo, testObjectThree);

        }
        //new方法:等同于先alloc在init
        TestObject *object = [TestObject new];
        //copy,mutableCopy:拷贝,需要遵守NSCopy协议和NSMutableCopy协议
        //判断实例对象是否响应某个方法
        BOOL instancesRespondToSelector = [TestObject instancesRespondToSelector:@selector(init)];
        NSLog(@"instancesRespondToSelector:%d", instancesRespondToSelector);
        instancesRespondToSelector = [object respondsToSelector:@selector(testMethod)];
        NSLog(@"instancesRespondToSelector:%d", instancesRespondToSelector);
        //判读是否遵守某个协议
        BOOL conformsToProtocol = [TestObject conformsToProtocol:NSProtocolFromString(@"NSCopying")];
        NSLog(@"conformsToProtocol:%d", conformsToProtocol);
        conformsToProtocol = [object conformsToProtocol:@protocol(NSObject)];
        NSLog(@"conformsToProtocol:%d", conformsToProtocol);
        
        //获取某个类的实例方法的指针
        TestObjectThree *objectThree = [[TestObjectThree alloc] init];
        TestObjectFour *objectFour = [[TestObjectFour alloc] init];
        objectThree.object = objectFour;
//        IMP imp = [TestObjectThree instanceMethodForSelector:@selector(instanceMethodOne)];
//        imp = [objectThree methodForSelector:@selector(instanceMethodTwo:)];
        //获取方法签名
//        NSMethodSignature *methodSignature = [TestObjectThree instanceMethodSignatureForSelector:@selector(instanceMethodOne)];
//        methodSignature = [objectThree methodSignatureForSelector:@selector(instanceMethodTwo:)];
        
        //处理没有实现的方法,该方法会抛出异常,unrecognized selector sent to instance, 当类或者对象调用某个方法时,如果不能响应该消息和不能转发该消息,runtime会自动发送该消息对接收者
//        [objectThree doesNotRecognizeSelector:@selector(copy)];
        //- (id)forwardingTargetForSelector:(SEL)aSelector:拦截某个消息,将其转发给返回的对象
        [objectThree performSelector:@selector(testMethodOne) withObject:nil];
        //-(void)forwardInvocation:(NSInvocation *)anInvocation:转发消息,通上面的方法的作用一致
        [(id)objectThree testMethodTwo:100];
        //类和对象的关系
        //获取类和父类
        Class klass = [objectThree class];
        Class superClass = [objectThree superclass];
        NSLog(@"class:%@, className:%@, superClass:%@, superClassName:%@, className:%@", klass, NSStringFromClass(klass), superClass, NSStringFromClass(superClass), objectThree.className);
        BOOL isKindOfClass = [objectThree isKindOfClass:[NSObject class]]; //判断是否是某个类或其子类的实例
        BOOL isMemberOfClass = [objectThree isMemberOfClass:[TestObjectTwo class]]; //判断是否是属于某个类的成员,而不是该类的父类或者子类
        BOOL isSubclass = [TestObjectThree isSubclassOfClass:[NSObject class]]; //判断某个类是不是另外一个类子类
        NSLog(@"isKindOfClass:%d, isMemberOfClass:%d,isSubClass:%d", isKindOfClass, isMemberOfClass, isSubclass);
        //resolveClassMethod:(SEL)sel: 是否可以为某个类方法提供动态实现
        //resolveInstanceMethod //是否可以为某个实例方法提供动态实现
        //description: 对象的描述信息,答应某个对象时,输出该信息
        //debugDescription:对象在调试器中的描述信息
        NSLog(@"objectThree:%@",objectThree);
        //hash:对象在hash表中的地址
        //对象的比较:两个对象如果相等,那么hash值一定相等的,如果hash值相等,这两个对象不一定相等
        BOOL isEqualTo = [object isEqual:objectThree];
        BOOL isProxy = [objectThree isProxy]; //是否为proxy类型,而不是继承自NSObject
        NSLog(@"isEqaulTo:%d, isProxy:%d", isEqualTo, isProxy);
        
        //发送消息
        //- (id)performSelector:(SEL)aSelector发送消息,不带参数
        //- (id)performSelector:(SEL)aSelector withObject:(id)object:发送消息,参数为object
        //- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2,发送消息,第一个参数为object2, 第二个参数为object1
        [objectThree performSelector:@selector(instanceMethodTwo:) withObject:@1000];
        
        
        
    }
    return 0;
}
