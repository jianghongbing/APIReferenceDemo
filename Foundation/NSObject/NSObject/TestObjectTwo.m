//
//  TestObjectTwo.m
//  NSObject
//
//  Created by pantosoft on 2018/4/12.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObjectTwo.h"

@implementation TestObjectTwo
+ (void)load {
    NSLog(@"class:%@, func:%@", NSStringFromClass(self), NSStringFromSelector(_cmd));
}
+ (void)initialize {
    NSLog(@"class:%@, func:%@", NSStringFromClass(self), NSStringFromSelector(_cmd));
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"class:%@, func:%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    return self;
}

- (void)dealloc {
    NSLog(@"class:%@, func:%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
@end
