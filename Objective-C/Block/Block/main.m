//
//  main.m
//  Block
//
//  Created by pantosoft on 2018/7/19.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
typedef int(^SumBlock)(int, int);

//定义一个全局block
int(^globalBlock)(int,int) = ^(int a, int b){
    printf("a:%d, b:%d\n", a, b);
    return a + b;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Block:C语言中的语法,和其他语言中的匿名函数,闭包类似,现在已经大量应用到了Cocoa和CocoaTouch当中
        //1.block的声明
        int(^aBlock)(int, int); //声明一个block
        //给block赋值
        aBlock = ^(int a, int b) {
            return a + b;
        };
        //2.block的调用
        int c = aBlock(5, 6);
        NSLog(@"c:%d", c);
        
        //3.使用typedef来定义block类型和简化block的使用
        //和block的block的功能一致,但使用更加简洁和明朗
        SumBlock bBlock = ^(int a, int b) {
            return a + b;
        };
        c = bBlock(10, 20);
        NSLog(@"c:%d", c);
        
        //4. 全局block
        c = globalBlock(100, 200);
        NSLog(@"c:%d", c);
        
        //5.捕获局部变量的block,在block内部尝试修改捕获的局部变量会报错,在捕获的过程中,会将捕获的变量作为常量来处理,不允许在block内部修改.
        int numberOne = 100, numberTwo = 200;
        int(^cBlock)(void) = ^{
//            numberOne = 200;
//            numberTwo = 100;
            return numberTwo - numberOne;
        };
        
        c = cBlock();
        NSLog(@"c:%d", c);
        
        //6.捕获__block变量,
        __block int numberThree = 1000;
        __block int numberFour = 2000;
        int (^dBlock)(int, int) = ^(int a, int b){
            NSLog(@"a:%d,b:%d,nunberThree:%d", a, b, numberThree);
            numberThree = 3000;
            return a + b + numberOne + numberTwo + numberThree + numberFour;
        };
        
        c = dBlock(100, 200);
        NSLog(@"c:%d, numberThree:%d", c, numberThree);
//        //copy block
//        int(^cBlock)(int, int) = [bBlock copy];
//        c = cBlock(1000, 2000);
//        NSLog(@"c:%d", c);
        
        //7. block的copy
        TestObject *testObject = [[TestObject alloc] init];
//        int(^eBlock)(int, int);
        {
            //在该块之后,还需要使用到fBlock,而fBlock是栈队列,在该块之后,其内存被回收,因此需要将其拷贝到堆上,拷贝到堆上block的内存需要我们来处理
            void (^fBlock)(int, int) = ^(int a, int b) {
                NSLog(@"blockCopy a:%d, b:%d", a, b);
            };
            testObject.testBlock = [fBlock copy];
        }
        [testObject excuteBlock];
        
        
//        int i;
//        int(^blockArray[10])(void);
//        for(int i = 0; i < 10; i++) {
//            blockArray[i] = ^{
//                return i;
//            };
//        }
//        
//        for (int n = 0; n < 10; n++) {
//            printf("result:%d", blockArray[n]());
//        }
    }
    return 0;
}
