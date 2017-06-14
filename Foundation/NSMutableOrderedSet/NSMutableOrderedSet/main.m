//
//  main.m
//  NSMutableOrderedSet
//
//  Created by jianghongbing on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMutableOrderedSet:可变的NSOrderedSet
        NSMutableOrderedSet *mutableOrderedSet = [NSMutableOrderedSet orderedSet];
        //1.添加元素
        [mutableOrderedSet addObject:@5];
        [mutableOrderedSet addObjectsFromArray:@[@1, @6, @2]];
        //2.删除元素
        if ([mutableOrderedSet containsObject:@2]) {
            [mutableOrderedSet removeObject:@2];
        }
        if (mutableOrderedSet.count > 0) {
            [mutableOrderedSet removeObjectAtIndex:0];
        }

        [mutableOrderedSet removeObjectsInArray:@[@5, @10, @100]];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        __unsafe_unretained NSNumber *objects[] = {@5, @9, @8, @3};
        [mutableOrderedSet addObjects:objects count:4];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:4];
        [mutableOrderedSet removeObjectsAtIndexes:indexSet];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        [mutableOrderedSet removeObjectsInRange:NSMakeRange(1, 2)];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        [mutableOrderedSet removeAllObjects];

        //3.change index
        NSArray *array = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9];
        [mutableOrderedSet addObjectsFromArray:array];
        //3.1 交换两个位置对应的元素
        [mutableOrderedSet exchangeObjectAtIndex:2 withObjectAtIndex:4];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        //3.2 将一个元素从当前位置移到指定位置
        [mutableOrderedSet moveObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 3)] toIndex:5];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        //3.3 修改对应位置元素的值
        [mutableOrderedSet setObject:@1000 atIndex:5];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        //3.4 插入元素
        [mutableOrderedSet insertObject:@100 atIndex:2];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        [mutableOrderedSet insertObjects:@[@10, @20, @30] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(5, 3)]];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        //3.5 替换元素
        [mutableOrderedSet replaceObjectAtIndex:0 withObject:@40];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        [mutableOrderedSet replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(5, 2)] withObjects:@[@80, @90]];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);


        //4. 并集,交集的相关操作
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:array];
        NSSet *set = [NSSet setWithArray:array];
        //4.1 移除掉交集中的元素
        [mutableOrderedSet intersectOrderedSet:orderedSet];
//        [mutableOrderedSet intersectSet:set]; //同上面的效果一样
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);
        //4.2 移除到set中的所有元素
        set = [NSSet setWithArray:@[@2, @4, @3, @5]];
        [mutableOrderedSet minusSet:set];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        //4.3 并集,两个set的并集
        [mutableOrderedSet unionOrderedSet:orderedSet];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        //5.排序
        [mutableOrderedSet sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
        [mutableOrderedSet sortUsingDescriptors:@[sortDescriptor]];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        [mutableOrderedSet sortWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);

        //对某一范围的元素排序
        [mutableOrderedSet sortRange:NSMakeRange(2, 4) options:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1];
        }];
        NSLog(@"mutableOrderSet:%@", mutableOrderedSet);



    }
    return 0;
}
