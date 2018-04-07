//
//  main.m
//  NSInvocation
//
//  Created by pantosoft on 2018/4/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSInvocation:封装了一个message的所有信息,消息的target目标者,参数,返回值,selector消息,用于存储消息和转发消息
        NSMethodSignature *methodSignature = [TestObject methodSignatureForSelector:@selector(doSomething)];
        //NSInvocation的构建
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        //        NSMethodSignature *signature = invocation.methodSignature; //获取invocation的methodSignature
        //        [invocation retainArguments]; //持有引用参数,默认invocation不持有引用参数,
        //        BOOL isRetainArguments = invocation.argumentsRetained; //是否持有参数
        invocation.target = [TestObject class]; //设置invocation的target
        invocation.selector = @selector(doSomething); //设置invocation的selector
        [invocation invoke]; //发送消息给你target,和设置invocation的返回值
        
        methodSignature = [TestObject methodSignatureForSelector:@selector(doSomethingWithParameterOne:parameterTwo:)];
        invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.selector = @selector(doSomethingWithParameterOne:parameterTwo:);
        id parameterOne = @10;
        id parameterTwo = @"test";
        //设置selector的参数,第一个参数为self,即是invocation的target,第二个参数为selector,所有设置参数从第三(index为2)位置开始
        [invocation setArgument:&parameterOne atIndex:2];
        [invocation setArgument:&parameterTwo atIndex:3];
        [invocation invokeWithTarget:[TestObject class]];
        
        //获取参数
        id getParameterOne;
        id getParameterTwo;
        [invocation getArgument:&getParameterOne atIndex:2];
        [invocation getArgument:&getParameterTwo atIndex:3];
        NSLog(@"getParameterOne:%@, getParameterTwo:%@", getParameterOne, getParameterTwo);
        
        TestObject *objectOne = [[TestObject alloc] initWithName:@"objectOne" objectId:@"001"];
        methodSignature = [objectOne methodSignatureForSelector:@selector(doSomethingWithParameterOne:parameterTwo:)];
        invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.selector = @selector(doSomethingWithParameterOne:parameterTwo:);
        [invocation setArgument:&parameterOne atIndex:2];
        [invocation setArgument:&parameterTwo atIndex:3];
        [invocation invokeWithTarget:objectOne];
        
        //获取返回值
        methodSignature = [objectOne methodSignatureForSelector:@selector(returnValueDoSomethingWithParameterOne:parameterTwo:)];
        invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.selector = @selector(returnValueDoSomethingWithParameterOne:parameterTwo:);
        [invocation setArgument:&parameterOne atIndex:2];
        [invocation setArgument:&parameterTwo atIndex:3];
        NSString *value = @"1234";
        [invocation setReturnValue:&value]; //设置返回值
        [invocation invokeWithTarget:objectOne];
        const char *returnValueType = methodSignature.methodReturnType;
        if (strcmp(returnValueType, @encode(id)) == 0) {
            void *result;
            [invocation getReturnValue:&result]; //获取返回值,在invoke后,方法返回的返回值会覆盖通过setReturnValue设置的返回值
            id returnValue = (__bridge id)result; //通过getRetureValue获取返回值时,result并没有获得对象的所有权,需要通过__bridge转换来获取所有权,否则发生内存错误
            NSLog(@"returnValue:%@", returnValue);
        }
    }
    return 0;
}
