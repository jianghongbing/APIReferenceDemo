//
//  main.m
//  NSMethodSignature
//
//  Created by pantosoft on 2018/4/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMethodSignture:方法签名,记录一个方法的参数返回值类型以及参数的个数
        Student *xiaoming = [[Student alloc] initWithName:@"xiaoming" studentId:@"001"];
        //获取某个类型某个方法的函数签名
        //如果消息接收者是个类型,selector需要传入类方法,如果消息接受者是对象类型,selctor需要传入实例方法
        NSMethodSignature *methodSignature = [Student methodSignatureForSelector:@selector(studentWithName:studentId:)];
        //获取方法参数个数
        NSInteger numberOfArguments = methodSignature.numberOfArguments;
        NSLog(@"numberOfArguments:%ld", numberOfArguments);
        //获取指定位置的参数类型
        for (int i = 0; i < numberOfArguments; i++) {
            const char * argument = [methodSignature getArgumentTypeAtIndex:i];
            NSLog(@"i:%d, argument type:%s", i, argument);
        }
        //参数占据的内存大小
        NSInteger frameLength = methodSignature.frameLength;
        NSLog(@"frameLength:%ld", frameLength);
        methodSignature = [xiaoming methodSignatureForSelector:@selector(gotoSchool)];
        numberOfArguments = methodSignature.numberOfArguments;
        NSLog(@"numberOfArguments:%ld", numberOfArguments);
        for (int i = 0; i < numberOfArguments; i++) {
            const char * argument = [methodSignature getArgumentTypeAtIndex:i];
            NSLog(@"i:%d, argument type:%s", i, argument);
        }
        
        methodSignature = [Student instanceMethodSignatureForSelector:@selector(gotoSchool)];
        numberOfArguments = methodSignature.numberOfArguments;
        NSLog(@"numberOfArguments:%ld", numberOfArguments);
        for (int i = 0; i < numberOfArguments; i++) {
            const char * argument = [methodSignature getArgumentTypeAtIndex:i];
            NSLog(@"i:%d, argument type:%s", i, argument);
        }
        frameLength = methodSignature.frameLength;
        NSLog(@"frameLength:%ld", frameLength);
    
        methodSignature = [xiaoming methodSignatureForSelector:@selector(examScore:)];
        //获取返回值类型和返回值类型内存大小
        const char *methodReturnType = methodSignature.methodReturnType;
        NSInteger methodReturnLength = methodSignature.methodReturnLength;
        NSLog(@"methodReturnType:%s, methodReturnLength:%ld", methodReturnType, methodReturnLength);
        //判断该方法是否为异步调用的,如果为异步不会阻塞当前线程,不需要等待该方法执行结束的答复
        BOOL isOneway = methodSignature.isOneway;
        NSLog(@"isOneWay:%d", isOneway);
        
        //通过log的输出可以知道,每一个方法签名最少有2个参数,第一个参数表示对象本身,第二个参数为该方法,其他的参数为方法接受的参数,前面两个参数也常常成为隐式参数
        //官方提供的OC类型对照表,第三方字典转模型的库的原理,就是通过类型比对,来进行转换
        // c - char
        // i - int
        // s - short
        // l - long
        // q - long long
        // C - unsigned char
        // I - unsigned int
        // S - unsigned short
        // L - unsigned long
        // Q - unsigned long long
        // f - float
        // d - double
        // B - bool
        // v - void
        // * - character string (char *)
        // @ - object (whether statically typed or typed id)
        // # - A class object (Class)
        // : - A method selector (SEL)
        // [array type] - An array
        // {name=type...} - A structure
        // (name=type...) - A union
        // bnum - A bit field of num bits
        // ^type - A pointer to type
        // ? - An unknown type (among other things, this code is used for function pointers)
        

        
    }
    return 0;
}
