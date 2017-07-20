//
//  main.m
//  NSMutableDictionary
//
//  Created by pantosoft on 2017/7/18.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMutableDictionary:可变的NSDictionary
        NSDictionary *dictionary = @{@"name" : @"jiang", @"age" : @27};
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        //1.修改指定key的值,如果字典中没有对应的key,将就key添加到字典中,并赋予对应的值
        mutableDictionary[@"name"] = @"hong";
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        [mutableDictionary setObject:@28 forKey:@"age"];
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        mutableDictionary[@"address"] = @"wuhan";
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        
        //2.移除对应key的值
        mutableDictionary[@"address"] = nil;
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        [mutableDictionary removeObjectForKey:@"age"];
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        
        //3.将另外一字典的元素添加到当前字典,若另外的字典中和当前字典中有相同的key时,会将对应key的值也替换掉
        [mutableDictionary addEntriesFromDictionary:dictionary];
        NSLog(@"mutableDictionary:%@", mutableDictionary);
        
        //4.移除一组key所对应的值和移除所有的值
        [mutableDictionary removeObjectsForKeys:@[@"age"]];
        [mutableDictionary removeAllObjects];
    }
    return 0;
}
