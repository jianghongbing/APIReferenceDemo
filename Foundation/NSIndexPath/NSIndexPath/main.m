//
//  main.m
//  NSIndexPath
//
//  Created by jianghongbing on 2017/6/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
<<<<<<< HEAD
        //NSIndexPath:一般用标记集合中某个元素在某一组的某一个位置
        //1.NSIndexPath的创建
        NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:2];

        NSUInteger indexes[10] = {0,1,2,3,4,5,6,7,8,9};

        NSIndexPath *indexPathTwo = [NSIndexPath indexPathWithIndexes:indexes length:8];
        NSLog(@"indexPath:%@, indexPathTwo:%@", indexPath, indexPathTwo);
        //2.获取indexPath的长度
        NSUInteger length = indexPathTwo.length;
        NSLog(@"lenth:%ld", length);

        //3.添加index
        indexPath = [indexPath indexPathByAddingIndex:3];
        NSLog(@"indexPath:%@,length:%ld", indexPath, indexPath.length);
        //4.移除index
        indexPath = [indexPath indexPathByRemovingLastIndex];
        NSLog(@"indexPath:%@,length:%ld", indexPath, indexPath.length);

        indexPath = [indexPath indexPathByAddingIndex:10];

        //5.获取指定位置的index,如果没有找到就为NSNotFound
        NSInteger index = [indexPath indexAtPosition:0];
        NSLog(@"index:%ld", index);
        index = [indexPath indexAtPosition:1];
        NSLog(@"index:%ld", index);

        //6.indexPath的比较
        NSComparisonResult result = [indexPath compare:indexPathTwo];
        NSLog(@"result:%ld", result);

        //7.获取某个范围的indexes
        NSUInteger indexesTwo[5] = {};
        [indexPathTwo getIndexes:indexesTwo range:NSMakeRange(2, 5)];
        for (int i = 0; i < 5; i++) {
            NSLog(@"index:%ld", *(indexesTwo + i));
        }
=======
        //NSIndexPath
>>>>>>> 183b2f72de95f8ea4ec1b756a45edc96c8418594
    }
    return 0;
}
