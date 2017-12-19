//
//  main.m
//  NSJSONSerialization
//
//  Created by pantosoft on 2017/12/18.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

void JSONToDictionary(void);
void JSONToArray(void);
void JSONToObject(void);
void DictionaryToJSON(void);
void ArrayToJSON(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSJSONSerialization:用于JSON数据和NSArray和NSDictionary之间的转换
        //1.将JSON字符串转换成NSDictionary
        JSONToDictionary();
        //2.将JSON字符串转换成数组
        JSONToArray();
        //3.当顶层对象不是NSArray或者NSDictionary时,将JSON转换成Object
        JSONToObject();
        //将Foundation对象转换成JSON时,需要遵守下面几点
        //a.顶层对象必须是NSArray或者NSDictionary类型
        //a.NSDictionary的key必须都是NSString类型
        //b.NSArray中元素必须是String, NSNumber, NSArray, NSDictionary,NSNull类型
        //c.NSNubmer的值不能为NAN或者无穷大的数
        //4.将Dictionary转换成JSON
        DictionaryToJSON();
        //5.将Array转换成JSON
        ArrayToJSON();
    }
    return 0;
}

void JSONToDictionary(void) {
    NSString *jsonString = @"{\"name\": \"jiang\", \"age\": 28}";
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
//    NSJSONReadingMutableContainers = (1UL << 0),
//    NSJSONReadingMutableLeaves = (1UL << 1),
//    NSJSONReadingAllowFragments = (1UL << 2)
    //序列化options
    //1.NSJSONReadingMutableContainers:返回的结果NSMutableArray或者NSMutableDictionary
    //2.NSJSONReadingMutableLeaves:返回的结果里面的对应key的值如果为字符串的话,为可变的字符串,貌似该选项存在bug,当获取指定key的值进行NSMutableString的操作时,程序会崩溃,报 unrecognized selector 的错误.
    //3.当json不是已字典或者数组的形式存在,但是有可以将其转换成Cocoa对象的时候,需要指定该选项
    //4.如果options:指定为0,这表示返回的结果不可变
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (!error) {
        NSLog(@"dictionary:%@", dictionary);
    }else {
        NSLog(@"error:%@", error);
    }
    
    NSMutableDictionary *mutableDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!error) {
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        [mutableDictionary setObject:@"hong" forKey:@"name"];
        NSLog(@"mutableDictionary:%@", mutableDictionary);
    }else {
        NSLog(@"error:%@", error);
    }
    
//    NSDictionary *mutableLeavesDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
//    if (!error) {
//        NSLog(@"mutableLeavesDictionary:%@", mutableLeavesDictionary);
//        NSMutableString *name = mutableLeavesDictionary[@"name"];
//        [name appendString:@",hehe"];
//        NSLog(@"name:%@", name);
//    }else {
//        NSLog(@"error:%@", error);
//    }
}

void JSONToArray(void){
    NSString * jsonString = @"[{\"name\": \"xiaoming\", \"age\": 12},{\"name\": \"daming\", \"age\": 15},{\"name\": \"laoli\", \"age\": 38}]";
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (!error) {
        NSLog(@"array:%@", array);
    }else {
        NSLog(@"error:%@", error);
    }
}
void JSONToObject(void) {
    NSString *jsonString = @"\"jiang\"";
    NSError *error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (!error) {
        NSLog(@"object:%@,class:%@", object, NSStringFromClass([object class]));
    }else {
        NSLog(@"error:%@", error);
    }
}
void DictionaryToJSON(void) {
    NSDictionary *info = @{@"name": @"xiaoming", @"age": @12};
    NSError *error = nil;
    //1.将Foundation对象转换成JSON的选项
    //1.1 NSJSONWritingPrettyPrinted:输出格式化,在中间插入一些换行符和空白符,使JSON的可读性更高
    //1.2 NSJSONWritingSortedKeys:排序,自动以key来排序,较小的排在前面
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:&error];
    if (!error) {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString:%@", jsonString);
    }else {
        NSLog(@"error:%@", error);
    }
}
void ArrayToJSON(void) {
    NSArray *infoes = @[@{@"name": @"xiaoming", @"age": @12}, @{@"name": @"daming", @"age": @15}];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoes options:NSJSONWritingSortedKeys error:&error];
    if (!error) {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString:%@", jsonString);
    }else {
        NSLog(@"error:%@", error);
    }
}
