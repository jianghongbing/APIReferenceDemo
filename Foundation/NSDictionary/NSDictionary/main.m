//
//  main.m
//  NSDictionary
//
//  Created by jianghongbing on 2017/7/9.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDictionary:以键值对的形式储存数据的集合,key必须唯一
        //1.NSDictionary的创建
//        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"jianghonogbing", @"name", @28, @"age", nil];
//        NSLog(@"dictionary:%@", dictionary);
//        dictionary = [[NSDictionary alloc] initWithObjects:@[@"jianghongbing", @28] forKeys:@[@"name", @"age"]];
//        NSLog(@"dictionary:%@", dictionary);
//        dictionary = [NSDictionary dictionary];
        //通过文件来初始化NSDictionary
//        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:];
//        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:]
        //字面量创建
        NSDictionary *dictionary = @{@"name": @"jiang", @"age": @27, @"address": @"武汉", @"city": @"武汉"};
        //2.获取某个键对应的值
        NSString *name = dictionary[@"name"];
        NSNumber *age = [dictionary valueForKey:@"age"];
        NSString *city = [dictionary objectForKeyedSubscript:@"city"];
        NSLog(@"name:%@, age:%@, city:%@", name, age, city);
        //3.键值对的数量
        NSInteger count = dictionary.count;
        NSLog(@"count:%ld", count);
        //4.获取所有的key和value
        NSArray *allKeys = dictionary.allKeys;
        NSArray *allValues = dictionary.allValues;
        NSLog(@"allKeys:%@, allValues:%@", allKeys, allValues);
        //5.获取某个值对应的所有key
        NSArray *keysForObject = [dictionary allKeysForObject:@"武汉"];
        NSLog(@"keysForObject:%@", keysForObject);
        //6.获取对应key的value,以数组的形式返回过来,如果不存该某个key,它对应的值就是notFoundMarker替代
        NSArray *array = [dictionary objectsForKeys:@[@"address", @"name", @"hehe", @"haha"] notFoundMarker:@"not found"];
        NSLog(@"array:%@", array);
        //7.sort keys
        NSDictionary *numbers = @{@"Zero" : @0, @"One" : @1, @"Two" : @2, @"Three" : @3, @"Four" : @4, @"Five" : @5, @"Six" : @6, @"Seven" : @7, @"Eight" : @8, @"Nine" : @9};
        NSArray *sortKeys = [numbers keysSortedByValueUsingSelector:@selector(compare:)];
        NSLog(@"sortKeys:%@", sortKeys);
        sortKeys = [numbers keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1];
        }];
        NSLog(@"sortKeys:%@", sortKeys);

        //8.NSDictionary的比较
        BOOL isEqual = [dictionary isEqualToDictionary:numbers];
        NSLog(@"isEqualTo:%d", isEqual);
        isEqual = [dictionary isEqualToDictionary:dictionary.copy];
        NSLog(@"isEqualTo:%d", isEqual);
        
        //9.将NSDictionary写到文件中去
//        numbers writeToFile: atomically:
//        numbers writeToURL: atomically:
        
        //10.NSDictionary的遍历,会将dictionary中的值进行遍历
        for (id value in numbers) {
            NSLog(@"value:%@", value);
        }
        
        [numbers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key:%@, value:%@", key, obj);
        }];
        
        [numbers enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key:%@, value:%@", key, obj);
        }];
        
        //11.indexPathTest
        NSSet *setKeys = [dictionary keysOfEntriesPassingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSString class]]) {
                return [obj isEqualToString:@"武汉"];
            }else if ([obj isKindOfClass:[NSNumber class]]) {
                return [obj compare:@25] == NSOrderedDescending;
            }else {
                return NO;
            }
        }];
        NSLog(@"setKeys:%@", setKeys);
        

    }
    return 0;
}
