//
//  main.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //KVC:键值编码,通过指定的key,间接设置和获取对应的值的机制
        //1.KVC的简单使用
        //1.1 NSDictionary和NSMutableDictionary.NSDictionary因为其不可变,所有不能通过setValue:ForKey的形式来改变指定key的值.NSMutableDictionary则可以通过setValue:ForKey来改变值
        NSDictionary *cities = @{@"wh": @"wuhan", @"bj": @"beijing", @"sh": @"shanghai"};
        NSString *city = [cities valueForKey:@"wh"];
        NSLog(@"city:%@", city);

        NSMutableDictionary *mutableCities = [cities mutableCopy];
        [mutableCities setValue:@"武汉" forKey:@"wh"];
        city = [mutableCities valueForKey:@"wh"];
        NSLog(@"city:%@", city);
        //1.2 NSArray:数组中的对象必须是以key-value的形式存在,当array调用setValueForKey或者valueForKey的时候,会向array中的每一个元素发送setValueForKey或者valueForKey的消息,如果NSArray通过setValueFor:Key的形式来改变元素的值,则元素必须是可变的字典,或者是自定义的对象
        NSArray *cityArray = @[@{@"name": @"wuhan", @"abbr": @"wh"},@{@"name": @"shanghai", @"abbr": @"shanghai"},@{@"name": @"beijing", @"abbr": @"bj"}];
        NSArray *cityNames = [cityArray valueForKey:@"name"];
        NSLog(@"cityArray:%@", cityNames);
        //1.3 NSSet和NSArray的KVC接口是一致的

        //2.自定义对象的KVO的使用
        //系统默认对继承自NSObject的对象通过category的形式实现了NSKeyValueCoding中定义的方法,所以继承自NSObject的对象可以直接使用KVC的方式来设置和获取值
        Student *xiaoMing = [[Student alloc] initWithName:@"xiaoMing" age:12 studentId:001];
        [xiaoMing setValue:@"daMing" forKey:@"name"];
        NSString *name = xiaoMing.name;
        NSLog(@"name:%@", name);
    }
    return 0;
}
