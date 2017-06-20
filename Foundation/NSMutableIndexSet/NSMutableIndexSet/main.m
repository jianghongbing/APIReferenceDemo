//
//  main.m
//  NSMutableIndexSet
//
//  Created by jianghongbing on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
        //1.添加index
        [indexSet addIndex:6];
        [indexSet addIndex:5];
        [indexSet addIndex:2];
        NSLog(@"indexSet:%@",indexSet);
        [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10, 20)]];
        NSLog(@"indexSet:%@", indexSet);
        [indexSet addIndexesInRange:NSMakeRange(100, 10)];
        NSLog(@"indexSet:%@", indexSet);

        //2.移除index
        if ([indexSet containsIndex:5]) {
            [indexSet removeIndex:5];
        }
        NSLog(@"indexSet:%@", indexSet);

        [indexSet removeIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(20, 10)]];
        NSLog(@"indexSet:%@", indexSet);

        [indexSet removeIndexesInRange:NSMakeRange(20, 100)];
        NSLog(@"indexSet:%@", indexSet);

        [indexSet removeAllIndexes];
        NSLog(@"indexSet:%@", indexSet);

        //3.指定的位置的index开始增加指定的大小
        [indexSet addIndexesInRange:NSMakeRange(10, 20)];
        [indexSet shiftIndexesStartingAtIndex:15 by:100];
        NSLog(@"indexSet:%@", indexSet);

    }
    return 0;
}
