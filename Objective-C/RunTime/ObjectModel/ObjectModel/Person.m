//
//  Person.m
//  ObjectModel
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}
- (void)eatting {
    NSLog(@"我在吃饭");
}

- (void)runAt:(NSString *)address {
    NSLog(@"我在%@跑步", address);
}

+ (void)classTestMethod {
    NSLog(@"类方法测试");
}

+ (NSString *)classTestMethod:(NSInteger)testInt {
    NSLog(@"类方法测试:%ld", testInt);
    return [NSString stringWithFormat:@"%ld", testInt];
}
@end
