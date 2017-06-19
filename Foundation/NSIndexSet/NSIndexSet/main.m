//
//  main.m
//  NSIndexSet
//
//  Created by jianghongbing on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSIndexSet:由任意的唯一的数字所组成的不可变的集合,一般用于NSArray,NSOrderSet等有序集合中,作为其中元素的index的集合使用

        //1.indexSet的创建
//        NSIndexSet *indexSet = [NSIndexSet indexSet];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:5];
        NSUInteger count = indexSet.count;

        NSLog(@"count:%ld", count);

        indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10, 20)];

        //2.indexSet中index的数量
        count = indexSet.count;
        NSLog(@"count:%ld", count);

        //3.第一个index和最后一个index
        NSUInteger firstIndex = indexSet.firstIndex;
        NSUInteger lastIndex = indexSet.lastIndex;
        NSLog(@"firstIndex:%ld, lastIndex:%ld", firstIndex, lastIndex);

        //4.获取indexSet中所有的index与指定的index比较后,最符合条件的index,如果不存在就为NSNotFound
        NSUInteger indexGreaterThan = [indexSet indexGreaterThanIndex:20];
        NSUInteger indexGreaterOrEqualThan = [indexSet indexGreaterThanOrEqualToIndex:25];
        NSUInteger indexLessThan = [indexSet indexLessThanIndex:25];
        NSUInteger indexLessOrEqualThan = [indexSet indexLessThanOrEqualToIndex:5];
        NSLog(@"indexGreaterThan:%ld\nindexGreaterOrEqualThan:%ld\nindexLessThan:%ld\nindexLessOrEqualThan:%ld", indexGreaterThan, indexGreaterOrEqualThan, indexLessThan, indexLessOrEqualThan);
        //5. 将符合条件的index写入到C语言的数组中去
        NSUInteger maxCount = 5;
        NSUInteger indexBuffer[maxCount];
        NSRange indexRange = NSMakeRange(5, 15);

        NSUInteger index = [indexSet getIndexes:indexBuffer maxCount:maxCount inIndexRange:&indexRange];
        NSLog(@"index:%ld", index);

        for (int i = 0; i < maxCount; i++) {
            NSLog(@"index in indexBuffer:%ld", *(indexBuffer + i));
        }

        //6. 是否包含index,range, indexSet
        BOOL isContains = [indexSet containsIndex:5];
        NSLog(@"isContains:%d", isContains);
        isContains = [indexSet containsIndexesInRange:NSMakeRange(12, 5)];
        NSLog(@"isContains:%d", isContains);
        NSIndexSet *anotherIndexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(15, 20)];
        isContains = [indexSet containsIndexes:anotherIndexSet];
        NSLog(@"isContains:%d", isContains);

        //7. indexSet的比较
        BOOL isEqual = [indexSet isEqualToIndexSet:anotherIndexSet];
        NSLog(@"isEqual:%d", isEqual);
        anotherIndexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10, 20)];
        isEqual = [indexSet isEqualToIndexSet:anotherIndexSet];
        NSLog(@"isEqual:%d", isEqual);

        //8. 是否与指定的range有并集
        BOOL isIntersects = [indexSet intersectsIndexesInRange:NSMakeRange(20, 30)];
        NSLog(@"isIntersects:%d", isIntersects);

        //9.indexSet的遍历
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"index:%ld", idx);
        }];

        [indexSet enumerateIndexesWithOptions:NSEnumerationConcurrent usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"index:%ld", idx);
        }];

        [indexSet enumerateIndexesInRange:NSMakeRange(20, 10) options:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"index:%ld", idx);
        }];

        [indexSet enumerateRangesUsingBlock:^(NSRange range, BOOL * _Nonnull stop) {
            NSLog(@"range:%@", NSStringFromRange(range));
        }];

        [indexSet enumerateRangesWithOptions: NSEnumerationReverse usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
            NSLog(@"range:%@", NSStringFromRange(range));
        }];

        [indexSet enumerateRangesInRange:NSMakeRange(20, 10) options:NSEnumerationReverse usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
            NSLog(@"range:%@", NSStringFromRange(range));
        }];

        //10. indexPassingTest:找出符合条件的index,如果没有符合的则为NSNotFound
        NSUInteger indexPassingTest = [indexSet indexPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            return idx > 20;
        }];
        NSLog(@"indexPassingTest:%ld", indexPassingTest);
        indexPassingTest = [indexSet indexWithOptions:NSEnumerationReverse passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            return idx > 20;
        }];
        NSLog(@"indexPassingTest:%ld", indexPassingTest);

        indexPassingTest = [indexSet indexInRange:NSMakeRange(10, 10) options:NSEnumerationConcurrent passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            return  idx > 20;
        }];
        NSLog(@"indexPassingTest:%ld", indexPassingTest);

        //11. indexPassingTestSet:找出所有的index,并且以indexSet的形式返回
        NSIndexSet *indexPassingTestSet = [indexSet indexesPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            *stop = idx >= 25;
            return idx > 20;
        }];

        NSLog(@"indexPassingTestSet:%@", indexPassingTestSet);

        indexPassingTestSet = [indexSet indexesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            return idx > 20;
        }];
        NSLog(@"indexPassingTestSet:%@", indexPassingTestSet);

        indexPassingTestSet = [indexSet indexesInRange:NSMakeRange(10, 10) options:NSEnumerationConcurrent passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
            return idx > 15;
        }];

        NSLog(@"indexPassingTestSet:%@", indexPassingTestSet);
    }
    return 0;
}
