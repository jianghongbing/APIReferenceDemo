//
//  Target.m
//  NSThread
//
//  Created by jianghongbing on 2017/12/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Target.h"

@implementation Target
- (void)excuteSelector {
    NSLog(@"func:%s,line:%d", __func__, __LINE__);
    NSLog(@"targetThread:%@", [NSThread currentThread]);
}

- (void)excuteSelectorTwo {
    int i = 10000;
    while (i-- > 0) {
        NSLog(@"i ==== %d", i);
    }
}


+ (void)excuteSelcttorWithNumber:(NSInteger)number {
    NSLog(@"classMethod:%@", [NSThread currentThread]);
    NSInteger testNumber = number;
    while (testNumber > 0) {
        NSLog(@"testNumber:%ld", testNumber);
        testNumber--;
    }
}
@end
