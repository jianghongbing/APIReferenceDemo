//
//  main.m
//  NSSet
//
//  Created by jianghongbing on 2017/6/8.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSSet:无序,没有重复元素的集合
        //1.NSSet的创建和初始化
        NSSet *set = [NSSet set];
        set = [NSSet setWithObject:@5];
        set = [[NSSet alloc] initWithArray:@[@5,@4,@5,@4,@3]];
        //2.set的count
        NSInteger elementCount = set.count;
        //3.获取任意一个元素
        id element = set.anyObject;
        //4.判断set是否包含某个元素
        BOOL isContains = [set containsObject:element];
        NSLog(@"set:%@,elemetCount:%ld,element:%@,isContains:%d", set,
              elementCount, element, isContains);

        //5.判断是不是sub set
        const NSNumber *setArray[10] = {@4,@5,@7,@8,@9,@1,@2,@0,@3,@6};
        NSSet *anotherSet = [NSSet setWithObjects:setArray count:5];
        BOOL isSubSet = [anotherSet isSubsetOfSet:set];
        //6.两个元素之间是否有交集
        BOOL isIntersects = [set intersectsSet:anotherSet];
        //7.连个set之间的比较
        BOOL isEqual = [set isEqualToSet:anotherSet];
        NSLog(@"isSubSet:%d, isIntersects:%d, isEqual:%d", isSubSet, isIntersects, isEqual);

        //8.添加元素
        NSSet *newSet = [set setByAddingObject:@100];
        NSLog(@"newSet:%@", newSet);
        newSet = [newSet setByAddingObjectsFromSet:anotherSet];
        NSLog(@"newSet:%@", newSet);
        newSet = [newSet setByAddingObjectsFromArray:@[@0,@12]];
        NSLog(@"newSet:%@", newSet);

        //9.set的遍历和枚举
        for (id obj in set) {
            NSLog(@"obj:%@", obj);
        }

        NSEnumerator *enumerator = set.objectEnumerator;
        id obj;
        while ((obj = enumerator.nextObject)) {
            NSLog(@"obj enumerator:%@",obj);
        }
        //10.以数组的形式放回set的所有元素
        NSArray *elementArray = [set allObjects];
        NSLog(@"array:%@",elementArray);

        //11.block方式遍历
        [set enumerateObjectsUsingBlock:^(NSNumber *number, BOOL *stop) {
            NSLog(@"number:%@",number);
            if ([number isEqualToNumber:@5]) {
                *stop = YES;
            }
        }];

        //并发遍历,需要注意线程的安全性
        [newSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"Obj:%@", obj);
        }];

        //12.获取符合条件元素的set集合
        NSSet *testSet = [newSet objectsPassingTest:^BOOL(id  _Nonnull obj, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedAscending;
        }];

        NSLog(@"testSet:%@", testSet);

    }
    return 0;
}
