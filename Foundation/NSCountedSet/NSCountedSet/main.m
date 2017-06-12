//
//  main.m
//  NSCountedSet
//
//  Created by jianghongbing on 2017/6/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSCountedSet继承自NSMutableSet,NSCountedSet会记录集合中每个元素的重复的次数

        NSCountedSet *set = [NSCountedSet setWithArray:@[@1, @1, @2, @3, @4, @4, @5, @4]];
        //获取某一个元素重复的数量
        NSUInteger count = [set countForObject:@1];
        NSLog(@"count:%ld", count);
        count = [set countForObject:@10];
        NSLog(@"count:%ld", count);
        [set addObject:@4];
        count = [set countForObject:@4];
        NSLog(@"count:%ld", count);
        [set removeObject:@1];
        NSLog(@"count:%ld", count);

        id obj = nil;
        NSEnumerator *enumerator = set.objectEnumerator;
        while (obj = [enumerator nextObject]) {
            NSLog(@"obj:%@", obj);
        }

    }
    return 0;
}
