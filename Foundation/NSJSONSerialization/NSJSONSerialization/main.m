//
//  main.m
//  NSJSONSerialization
//
//  Created by pantosoft on 2017/12/18.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

void JSONToDictionary(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSJSONSerialization:用于JSON数据和NSArray和NSDictionary之间的转换
        //1.将JSON字符串转换成NSDictionary
        JSONToDictionary();
        
        
        
        
        
        //通过NSJSONSerialization将NSDictionary或者NSArray序列化成JSON,需要遵守以下几点
        //1.NSDictionary的key必须都是NSString类型
        //2.NSArray中元素必须是String, NSNumber, NSArray, NSDictionary,NSNull类型
        //3.NSNubmer的值不能为NAN或者无穷大的数
    }
    return 0;
}

void JSONToDictionary(void) {
//    NSString *jsonString = @"{\}";
}
