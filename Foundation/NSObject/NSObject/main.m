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
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSObject:Objective-C所有类的基类(NSProxy例外)
        //1.对象的生命周期相关方法
        {
            TestObject *testObjectOne = [[TestObject alloc] init];
            TestObject *testObjectTwo = [[TestObjectOne alloc] init];
            TestObjectThree *testObjectThree = [[TestObjectThree alloc] init];
            NSLog(@"testObjectOne:%@, testObjectTwo:%@, testObjectThree:%@", testObjectOne, testObjectTwo, testObjectThree);

        }
    }
    return 0;
}
