//
//  main.m
//  NSPredicate
//
//  Created by pantosoft on 2017/8/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSPredicate: 用于评估是否符合某一个条件,一般用于集合类型中,删选出符合条件的元素
        Person *personOne = [[Person alloc] initWithName:@"jiang" age:15];
        Person *personTwo = [[Person alloc] initWithName:@"hong" age:25];
        Person *personThree = [[Person alloc] initWithName:@"jiaNg" age:19];
        Person *personFour = [[Person alloc] initWithName:@"hehe" age:17];
        NSArray *personArray = @[personOne, personTwo, personThree, personFour];
        //1.predicate的创建
        NSString *name = @"jiang";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains %@", @"n"];
        //2.评估是否匹配
        BOOL isMatch = [predicate evaluateWithObject:name];
        NSLog(@"isMatch:%d", isMatch);
        //3.获取predicate最后转换的format
        NSString *format = predicate.predicateFormat;
        NSLog(@"format:%@", format);
        //4.使用block来创建NSPredicate
        predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary<NSString *,id> * bindings) {
            return evaluatedObject.length > 10;
        }];
        isMatch = [predicate evaluateWithObject:name];
        NSLog(@"isMatch:%d", isMatch);
        
        predicate = [NSPredicate predicateWithFormat:@"name contains %@ and age > %ld", @"n", 15, nil];
        NSLog(@"format:%@", predicate.predicateFormat);
        NSArray *filterArray = [personArray filteredArrayUsingPredicate:predicate];
        for (Person *person in filterArray) {
            NSLog(@"name:%@, age:%ld", person.name, person.age);
        }
        //5.创建恒为对或者恒为错的predicate表达式
        //恒为错的predicate评估任何对象,都返回NO,如果用其来过滤集合的元素则都会过滤掉,一个元素也不会满足条件,恒为对的predicate恰好相反
        NSPredicate *flasePredicate = [NSPredicate predicateWithValue:NO];
        isMatch = [flasePredicate evaluateWithObject:name];
        filterArray = [personArray filteredArrayUsingPredicate:flasePredicate];
        NSLog(@"isMatch:%d, filterArrayCount:%ld", isMatch, filterArray.count);
        NSPredicate *truePredicate = [NSPredicate predicateWithValue:YES];
        isMatch = [truePredicate evaluateWithObject:name];
        filterArray = [personArray filteredArrayUsingPredicate:truePredicate];
        NSLog(@"isMatch:%d, filterArrayCount:%ld", isMatch, filterArray.count);
        //6.allowEvaluat:安全评估? 不知道啥作用
        [predicate allowEvaluation];
        //7.predicate的一些常用语法
        //判断符号 ==, = 相等 > 大于, >= 大于或等于, <小于, <= 小于或等于, !=不等于
        //逻辑符号 AND &&,逻辑与, OR ||逻辑或, NOT !,逻辑非
        //字符相关 CONTAINS:包含某个字符串, BEGINSWITH,以某个字符串开头, ENDSWITH以某个字符串结尾, LIKES:模糊匹配,MATCHES匹配
        //[cd], c忽略大小写, d忽略重音的影响
        
        predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ AND age >= %ld", @"N", 17];
        filterArray = [personArray filteredArrayUsingPredicate:predicate];
        for (Person *person in filterArray) {
            NSLog(@"name:%@, age:%ld", person.name, person.age);
        }
    }
    return 0;
}
