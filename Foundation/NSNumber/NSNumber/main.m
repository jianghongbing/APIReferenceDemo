//
//  main.m
//  NSNumber
//
//  Created by jianghongbing on 2017/10/10.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSNumber:基本数字的包装类族,不同的数字类型对应着具体的不同的私有number类型,继承自NSValue
        //1.NSNumber的创建:将基本数据类型封装成NSNumber
        NSNumber *numberOne = [NSNumber numberWithInt:10];
        //字面量创建
        NSNumber *numberTwo = @10;

        NSNumber *charNumber = [NSNumber numberWithChar:'J'];
        NSNumber *boolNumber = @(YES);

        //2.NSNumber解包成基本数据类型
        int value = [numberOne intValue];
        char charValue = [charNumber charValue];
        BOOL boolValue = [boolNumber boolValue];
        NSLog(@"value:%d,charValue:%c,boolValue:%d", value, charValue, boolValue);
        //3.NSNumber的比较
        NSComparisonResult result = [numberOne compare:numberTwo];
        //4.是否相等
        BOOL isEqual = [numberTwo isEqualToNumber:numberOne];
        NSLog(@"result:%ld,isEqual:%d", (long)result, isEqual);

        
    }
    return 0;
}
