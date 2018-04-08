//
//  SynthesizeTest.m
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SynthesizeTest.h"

@implementation SynthesizeTest
@synthesize name = _myName; //将属性和声明的实例关联起来,编译器将不会生成_name的成员变量,用_myName替代
@synthesize age = myAge; //将熟悉合成myAge,编译器将不会生成_age的成员变量,用myAge来替代
- (void)setAge:(NSInteger)age {
    myAge = age;
}

- (NSInteger)age {
    return myAge;
}

- (void)logInfo {
    NSLog(@"SynthesizeTest:%@, name:%@, age:%ld", self, _myName, myAge);

}
@end
