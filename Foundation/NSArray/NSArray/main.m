//
//  main.m
//  NSArray
//
//  Created by jianghongbing on 2017/7/5.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

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


        
    }
    return 0;
}
