//
//  main.m
//  NSMutableSet
//
//  Created by jianghongbing on 2017/6/8.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMutableSet可变的set
        //添加元素
        NSMutableSet *set = [NSMutableSet set];
        [set addObject:@5];
        [set addObjectsFromArray:@[@1, @10, @20]];
        NSLog(@"set:%@", set);

        //移除元素
        id obj = @10;
        if ([set containsObject:obj]) {
            [set removeObject:obj];
        }
        NSLog(@"set:%@", set);


        NSSet *otherSet = [NSSet setWithArray:@[@1, @5, @100, @3]];
        //移除掉不是otherSet中的元素,交集
        [set intersectSet:otherSet];
        NSLog(@"set:%@", set);

        //移除掉otherSet中的元素,非交集
        [set addObjectsFromArray:@[@1, @5, @3, @4, @6]];
        [set minusSet:otherSet];
        NSLog(@"set:%@", set);
        //并集
        [set unionSet:[NSSet setWithArray:@[@1, @5, @3, @4, @6, @7, @9]]];
        NSLog(@"set:%@", set);

        //设置为其他set
        [set setSet:otherSet];
        NSLog(@"set:%@", set);

        //移除所有的元素
        [set removeAllObjects];

        //
        NSMutableSet *mutableSet = [NSMutableSet setWithCapacity:3];
        [mutableSet addObjectsFromArray:@[@1, @2, @3, @4, @5]];
        NSLog(@"mutableSet:%@", mutableSet);




    }
    return 0;
}
