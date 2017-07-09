//
//  main.m
//  NSArray
//
//  Created by jianghongbing on 2017/7/5.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
NSInteger sortedFunction(NSNumber *one, NSNumber *two, void *context) {
    return [two compare:one];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSArray:有序的,一些列对象的集合,Cocoa中最常用的集合类型之一
        //1.NSArray的创建方式
        //NSArray *array = [[NSArray alloc] initWithObjects:@1, @2, nil];
        //NSArray *array = [NSArray arrayWithObjects:@1, @2, nil];
//        NSArray *array = [NSArray alloc] initWithContentsOfFile:<#(nonnull NSString *)#>
//        NSArray *array = [NSArray alloc] initWithArray:<#(nonnull NSArray *)#>
//        NSArray *array = [NSArray arrayWithObject:@2];
//        NSArray *array = [[NSArray alloc] initWithArray:@[@1] copyItems:YES];
//        NSArray *array = [NSArray array];
        //字面量创建
        NSArray *array = @[@1, @2, @3, @4, @5];
        //2.数组的数量
        NSInteger count = array.count;
        NSLog(@"count:%ld", count);
        //3.获取指定位置的元素
        id element = array[2];
        element = [array objectAtIndex:2];
        //4.判断某个数组中是否存在某个元素
        BOOL isContains = [array containsObject:element];
        NSLog(@"isConatains:%d", isContains);
        //5.获取指定元素的位置
        if (isContains) {
            NSInteger index = [array indexOfObject:element];
            //5.1获取某个范围中的该元素的位置
//            index = [array indexOfObject:element inRange:NSMakeRange(3, 2)];
            NSLog(@"index:%ld", index);
        }


        //6.fisrt object && last object
        id firstObject = array.firstObject;
        id lastObject = array.lastObject;
        NSLog(@"firstObject:%@, lastObject:%@", firstObject, lastObject);
        //7.获取与指定元素完全相同的元素所在的index,如果不存在则为NSNotFound
        NSInteger index = [array indexOfObjectIdenticalTo:@5];
        NSLog(@"index:%ld", index);
        index = [array indexOfObject:@3 inRange:NSMakeRange(3, 2)];
        NSLog(@"index:%ld", index);

        //8.添加元素
        array = [array arrayByAddingObject:@4];
        array = [array arrayByAddingObjectsFromArray:@[@6, @9, @8, @7]];

        //9.将数组中的元素连成字符串
        NSString *elementString = [array componentsJoinedByString:@","];
        NSLog(@"elementString:%@", elementString);

        //10.和另外一个数组相同的最靠前的元素
        id commonObj = [array firstObjectCommonWithArray:@[@3, @2, @1, @1]];
        NSLog(@"commonObj:%@", commonObj);

        //11.数组的比较哦
        BOOL isEqual = [array isEqualToArray:@[@1, @3]];
        NSLog(@"isEqual:%d", isEqual);

        //12.将数组写入到文件中
//        BOOL success = [array writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>]
//        BOOL success = [array writeToURL:<#(nonnull NSURL *)#> atomically:<#(BOOL)#>]

        //13.枚举器
        //正向枚举器
        NSEnumerator *enumrator = array.objectEnumerator;
        id enumratorObj;
        while (enumratorObj = [enumrator nextObject]) {
            NSLog(@"enumratorObj:%@", enumratorObj);
        }
        //反向枚举器
        enumrator = array.reverseObjectEnumerator;
        while (enumratorObj = [enumrator nextObject]) {
            NSLog(@"enumratorObj:%@", enumratorObj);
        }

        //14.遍历
        //1.for循环遍历
        for (int i = 0; i < array.count; i++) {
            id obj = array[i];
            NSLog(@"obj:%@", obj);
        }

        //2.快速遍历
        for (id obj in array) {
            NSLog(@"obj:%@", obj);
        }

        //3.block 遍历
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"obj:%@", obj);
        }];

        [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj compare:@5] == NSOrderedDescending) {
                *stop = YES;
            }
            NSLog(@" block obj:%@", obj);
        }];

        [array enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndex:4] options:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@" block obj:%@", obj);
        }];


        //15.sort排序
        NSArray *sortArray = [array sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"sortArray:%@",sortArray);

        sortArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//            return [obj1 compare:obj2];
            return [obj2 compare:obj1];
        }];
        NSLog(@"sortArray:%@",sortArray);


        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];

        sortArray = [array sortedArrayUsingDescriptors:@[descriptor]];
        NSLog(@"sortArray:%@",sortArray);


        sortArray = [array sortedArrayUsingFunction:sortedFunction context:NULL];
        NSLog(@"sortArray:%@",sortArray);

        sortArray = [array sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];


        //16.indexOfPassinTest:查找获取匹配条件元素的index

        index = [array indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@4] == NSOrderedSame;
        }];
        NSLog(@"index:%ld",index);

        index = [array indexOfObjectWithOptions:NSEnumerationReverse passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@4] == NSOrderedSame;
        }];
        NSLog(@"index:%ld",index);

        index = [array indexOfObjectAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(5, 5)] options:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"index:%ld",index);

        //二分查找
        index = [array indexOfObject:@5 inSortedRange:NSMakeRange(0, array.count) options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"index:%ld",index);



//        index = [array indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        }];

        NSIndexSet *indexSet = [array indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@5] == NSOrderedDescending;
        }];
        NSLog(@"indexSet:%@",indexSet);

//        indexSet = [array indexesOfObjectsAtIndexes:<#(nonnull NSIndexSet *)#> options:<#(NSEnumerationOptions)#> passingTest:<#^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)predicate#>]

        indexSet = [array indexesOfObjectsWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj compare:@4] == NSOrderedSame;
        }];

        NSLog(@"indexSet:%@",indexSet);
    }
    return 0;
}



