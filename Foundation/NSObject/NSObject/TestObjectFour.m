//
//  TestObjectFour.m
//  NSObject
//
//  Created by pantosoft on 2018/4/13.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObjectFour.h"

@implementation TestObjectFour
- (void)testMethodOne {
    NSLog(@"testMethodOne");
}

- (void)testMethodTwo:(NSInteger)number {
    NSLog(@"testMethodTwo:%ld", number);
}

@end
