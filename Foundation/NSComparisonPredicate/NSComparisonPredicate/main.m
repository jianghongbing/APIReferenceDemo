//
//  main.m
//  NSComparisonPredicate
//
//  Created by pantosoft on 2018/5/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *studentList = @[[[Student alloc] initWithName:@"zhangsan" studentId:@"1" age:10],
                                 [[Student alloc] initWithName:@"lisi" studentId:@"2" age:11],
                                 [[Student alloc] initWithName:@"wangwu" studentId:@"3" age:12],
                                 [[Student alloc] initWithName:@"zhaoliu" studentId:@"4" age:13],
                                 [[Student alloc] initWithName:@"xiaoming" studentId:@"5" age:14],
                                 [[Student alloc] initWithName:@"xiaomao" studentId:@"6" age:15],
                                 [[Student alloc] initWithName:@"xiaoli" studentId:@"7" age:16],
                                 [[Student alloc] initWithName:@"xiaoqing" studentId:@"8" age:17],
                                 [[Student alloc] initWithName:@"xiaogou" studentId:@"9" age:18],
                                 [[Student alloc] initWithName:@"dahuang" studentId:@"10" age:19],
                                 [[Student alloc] initWithName:@"jiangqi" studentId:@"11" age:20],
                                 [[Student alloc] initWithName:@"huba" studentId:@"12" age:21]];
        
        //NSComparionPredicate:比较谓词,通过比较左右表达式的值来评估的对象是否符合该条件

        
        //NSComparisonPredicateOptions
        //NSCaseInsensitivePredicateOption //忽略大小写
        //NSDiacriticInsensitivePredicateOption //忽略大小写,但是区别发音
        //NSNormalizedPredicateOption //正常比较
        //NSComparisonPredicateModifier
        //NSDirectPredicateModifier,直接比较
        //NSAllPredicateModifier, 所有的都比较,都符合为真
        //NSAnyPredicateModifier,任意一个比较,一个符合就为真

        //NSPredicateOperatorType
        //NSLessThanPredicateOperatorType = 0, //小于
        //NSLessThanOrEqualToPredicateOperatorType,小于或等于
        //NSGreaterThanPredicateOperatorType, //大于
        //NSGreaterThanOrEqualToPredicateOperatorType, 大于或等于
        //NSEqualToPredicateOperatorType, //等于
        //NSNotEqualToPredicateOperatorType, //不等于
        //NSMatchesPredicateOperatorType, //匹配
        //NSLikePredicateOperatorType, //类似
        //NSBeginsWithPredicateOperatorType, //以某个值开始
        //NSEndsWithPredicateOperatorType, //以某个值结束
        //NSInPredicateOperatorType, // 在某个值中
        //NSCustomSelectorPredicateOperatorType,//自定义比较符
        //NSContainsPredicateOperatorType //包含某个值
        //NSBetweenPredicateOperatorType, //在两个值之间

        
        
        NSExpression *leftExpression = [NSExpression expressionForKeyPath:@"age"];
        NSExpression *rightExpression = [NSExpression expressionForConstantValue:@15];
        NSComparisonPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:leftExpression rightExpression:rightExpression modifier:NSDirectPredicateModifier type:NSGreaterThanPredicateOperatorType options:NSCaseInsensitivePredicateOption];
        //找出所有大于15岁的同学
        NSArray *filterStudents = [studentList filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", filterStudents);
        
        leftExpression = [NSExpression expressionForKeyPath:@"name"];
        rightExpression = [NSExpression expressionForConstantValue:@"XIAO"];
        predicate = [NSComparisonPredicate predicateWithLeftExpression:leftExpression rightExpression:rightExpression modifier:NSDirectPredicateModifier type:NSBeginsWithPredicateOperatorType options:NSCaseInsensitivePredicateOption];
        //找出以xiao开头的名字的学生,忽略大小写
        filterStudents = [studentList filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", filterStudents);
        
        
        //通过函数的形式来比较
        //找出年龄等于15岁的同学
        leftExpression = [NSExpression expressionForKeyPath:@"age"];
        rightExpression = [NSExpression expressionForConstantValue:@15];
        predicate = [NSComparisonPredicate predicateWithLeftExpression:leftExpression rightExpression:rightExpression customSelector:@selector(isEqual:)];
        filterStudents = [studentList filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", filterStudents);
        
        
        
        
        
        
    }
    return 0;
}
