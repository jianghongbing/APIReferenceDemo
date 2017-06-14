//
//  main.m
//  NSOrderedSet
//
//  Created by jianghongbing on 2017/6/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSOrderedSet:有序的,元素唯一的集合
        //1.NSOrderSet的创建
        NSOrderedSet *setOne = [NSOrderedSet orderedSet]; //创建一个空的orderedSet
        setOne = [NSOrderedSet orderedSetWithObjects:@3, @5, nil];
        setOne = [NSOrderedSet orderedSetWithObject:@4];
//        setOne = [NSOrderedSet orderedSetWithOrderedSet:]
//        setOne = [NSOrderedSet orderedSetWithSet:<#(nonnull NSSet *)#>]
        setOne = [NSOrderedSet orderedSetWithArray:@[@1, @2]];
        //还有多种与便利构造方法相对应的初始化构造方法
        NSOrderedSet *orderedSet = [[NSOrderedSet alloc] initWithArray:@[@1, @1, @3, @5, @6]];
        //2.orderSet元素的数量
        NSInteger count = orderedSet.count;
        NSLog(@"count:%ld", count);
        //3.获取指定元素的index
        NSInteger index = [orderedSet indexOfObject:@5];
        //4.获取指定位置的元素
        id obj = [orderedSet objectAtIndex:2];
        NSLog(@"index:%ld, obj:%@", index, obj);
        //5.获取第一个和最后一个元素
        id firstObj = orderedSet.firstObject;
        id lastObj = orderedSet.lastObject;
        NSLog(@"firstObject:%@, lastObject:%@", firstObj, lastObj);
        //6.获取指定位置的元素,并且以数组的形式返回
        NSArray *array = [orderedSet objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 2)]];
        NSLog(@"array:%@", array);

        __unsafe_unretained id c_array[3];
        [orderedSet getObjects:c_array range:NSMakeRange(1, 3)];
        for (int i = 0; i < sizeof(c_array) / sizeof(c_array[0]); i++) {
            id obj = c_array[i];
            NSLog(@"obj:%@", obj);
        }

        //7.array和set属性
        array = orderedSet.array;
        NSSet *set = orderedSet.set;
        //8.一些判断方法
        BOOL isContains = [orderedSet containsObject:@10]; //是否包含某个元素
        NSLog(@"isContains:%d", isContains);
        BOOL isIntersects = [orderedSet intersectsOrderedSet:setOne]; //和另外一个orderedSet是否有交集
        NSLog(@"isIntersects:%d", isIntersects);
        isIntersects = [orderedSet intersectsSet:set]; //和另外一个set是否有交集
        NSLog(@"isIntersects:%d", isIntersects);

        NSOrderedSet *setTwo = [NSOrderedSet orderedSetWithArray:@[@0, @1, @2, @3, @4, @5, @6, @6, @8, @9]];
        BOOL isSub = [orderedSet isSubsetOfOrderedSet:setTwo]; //是否是另外一个orderedSet的子集
        NSLog(@"isSub:%d", isSub);
        isSub = [orderedSet isSubsetOfSet:set]; //是否是另外一个set的子集
        NSLog(@"isSub:%d", isSub);

        //9.反转,所有的元素倒过来的orderSet
        NSOrderedSet *reversedOrderedSet = orderedSet.reversedOrderedSet;
        //10.快速遍历和枚举器
        //正向枚举器
        NSEnumerator *enumrator = reversedOrderedSet.objectEnumerator;
        id testObj;
        while ((testObj = enumrator.nextObject)) {
            NSLog(@"testObj:%@", testObj);
        }

        //反向枚举器
        NSEnumerator *reversedEnumrator = reversedOrderedSet.reverseObjectEnumerator;

        while ((testObj = reversedEnumrator.nextObject)) {
            NSLog(@"testObj:%@", testObj);
        }

        //快速遍历
        for (id obj in orderedSet) {
            NSLog(@"obj:%@", obj);
        }

        //block遍历
        NSOrderedSet *setThree = [NSOrderedSet orderedSetWithArray:@[@4, @5, @0, @1, @3, @6, @7, @2, @8, @9]];
        [setThree enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isEqualToNumber:@7] ) {
                *stop = YES;
            }
            NSLog(@"obj:%@",obj);
        }];

        //有条件的block遍历, 1.NSEnumerationConcurrent并发遍历 2.NSEnumerationReverse反向遍历
        [setThree enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"obj:%@",obj);
        }];

        //对其中一部分元素进行遍历
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 5)];
        [setThree enumerateObjectsAtIndexes:indexSet options:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"obj:%@",obj);
        }];

        //11.passingTest.当碰到符合条件的情况,便停止遍历
        NSInteger passingTestIndex = [setThree indexOfObjectPassingTest:^BOOL(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"passingTestIndex:%ld", passingTestIndex);

        //有条件的passingTest
        passingTestIndex = [setThree indexOfObjectWithOptions:NSEnumerationReverse passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"passingTestIndex:%ld", passingTestIndex);
        //对某一部分元素进行测试
        passingTestIndex = [setThree indexOfObjectAtIndexes:indexSet options:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"passingTestIndex:%ld", passingTestIndex);

        //12. indexSet passing test.会将所有符合条件的元素的index,封装成一个indexSet
        NSIndexSet *passingIndexSet = [setThree indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"passingIndexSet:%@", passingIndexSet);

        // 有条件的indexPassing
        passingIndexSet = [setThree indexesOfObjectsWithOptions:NSEnumerationReverse passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedSame;
        }];
        NSLog(@"passingIndexSet:%@", passingIndexSet);
        //测试一部分元素
        passingIndexSet = [setThree indexesOfObjectsAtIndexes:indexSet options:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedAscending;
        }];
        NSLog(@"passingIndexSet:%@", passingIndexSet);

        //13.二分查找

        index = [setThree indexOfObject:@6 inSortedRange:NSMakeRange(0, 7) options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"index:%ld", index);

        //14.排序
        NSArray *sortedArray = [setThree sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"sortedArray:%@", sortedArray);

//        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];

        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)];

        sortedArray = [setThree sortedArrayUsingDescriptors:@[sortDescriptor]];
        NSLog(@"sortedArray:%@", sortedArray);


        sortedArray = [setThree sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj compare:obj2];
        }];
        NSLog(@"sortedArray:%@", sortedArray);

        //description
        NSString *setDescription = [setThree description];
        NSLog(@"setDescription:%@", setDescription);
    }
    return 0;
}
