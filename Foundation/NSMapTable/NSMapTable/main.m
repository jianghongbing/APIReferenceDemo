//
//  main.m
//  NSMapTable
//
//  Created by pantosoft on 2017/11/9.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMapTable:和NSDictionary非常相似,以键值对的形式存储值,NSDictionary中对key进行copy,对值进行强引用,但是NSMapTable可以不对其中的key进行copy和不对value进行强用,当key或者value所指的对象被系统回收后,NSMapTable会自动清除key或者value,NSMapTable没有是可变的,没有不可变的版本
        //1.NSMapTable的创建
        //NSMapTableStrongMemory:对key或者value进行强引用
        //NSMapTableCopyIn:对key或者value进行copy
        //NSMapTableWeakMemory:对key或者value进行弱引用
        //NSMapTableObjectPointerPersonality:直接使用指针来进行相等性和散列检查
        NSMapTable *weakValueMapTable = [[NSMapTable alloc] initWithKeyOptions:NSMapTableCopyIn valueOptions:NSMapTableWeakMemory capacity:5];
        
        NSObject *testObject = [[NSObject alloc] init];
        NSString *mapKeyOne = @"mapKeyOne";
        //2.给指定的key设置value
        [weakValueMapTable setObject:testObject forKey:mapKeyOne];
        //3.获取指定key的值
        id objectOne = [weakValueMapTable objectForKey:mapKeyOne];
        NSLog(@"value:%@", objectOne);
        NSLog(@"mapTable:%@", weakValueMapTable);
        //4.获取key和value的pointerFunctions
        NSPointerFunctions *keyPointerFunctions = weakValueMapTable.keyPointerFunctions;
        NSPointerFunctions *valuePointerFunctions = weakValueMapTable.valuePointerFunctions;
        NSLog(@"keyPointerFunctions:%@,valuePointerFunctions:%@", keyPointerFunctions, valuePointerFunctions);
        
        NSString *mapKeyTwo = @"mapKeyTwo";
        id objectTwo = [NSObject new];
        [weakValueMapTable setObject:objectTwo forKey:mapKeyTwo];
        NSLog(@"mapTable:%@", weakValueMapTable);
        //5.获取table的key value的数量
        NSUInteger count = weakValueMapTable.count;
        NSLog(@"count:%ld", count);
        //6.NSMapTable的key和value枚举器
        NSEnumerator *keyEnumrator = [weakValueMapTable keyEnumerator];
        NSEnumerator *valueEnumrator = [weakValueMapTable objectEnumerator];
//        for (NSString *key in keyEnumrator) {
//            NSLog(@"key:%@", key);
//        }
//
//        for (NSObject *object in valueEnumrator) {
//            NSLog(@"value:%@", object);
//        }
        id key, value;
        while (key = [keyEnumrator nextObject]) {
            NSLog(@"key:%@", key);
        }
        while (value = [valueEnumrator nextObject]) {
            NSLog(@"value:%@", value);
        }
        //5.移除某一个键值对
        [weakValueMapTable removeObjectForKey:mapKeyTwo];
        NSLog(@"mapTable:%@", weakValueMapTable);
        //6.移除所有的键值对
        [weakValueMapTable removeAllObjects];
        NSLog(@"count:%ld", weakValueMapTable.count);
        objectOne = [NSObject new];
        [weakValueMapTable setObject:objectOne forKey:mapKeyOne];
        objectOne = nil;
        //7.当objectOne被系统回收时,mapTable也会自动清除所指向objectOne的key的这条记录
        NSLog(@"mapTable:%@", weakValueMapTable);
        //8.weak key map table
        NSMapTable *weakKeyMapTable = [NSMapTable weakToStrongObjectsMapTable];
        NSObject *mapKeyThree = [[NSObject alloc] init];
        objectOne = [[NSObject alloc] init];
        [weakKeyMapTable setObject:objectOne forKey:mapKeyThree];
        mapKeyThree = nil;
        //当前weakKeyMapTable中的key所指像的对象被回收后,mapTable会自动移除掉这一键值对记录
        NSLog(@"weakKeyMapTable:%@", weakKeyMapTable);
        //9.strong key和strong value map table
        NSMapTable *mapTable = [NSMapTable strongToStrongObjectsMapTable];
        [mapTable setObject:objectOne forKey:mapKeyOne];
        objectOne = nil;
        mapKeyOne = nil;
        NSLog(@"mapTable:%@", mapTable);
        //10.关于map table的一些其他C语言相关函数
        NSResetMapTable(mapTable);//相当于remove all objects
        NSLog(@"mapTable:%@", mapTable);

//        NSFreeMapTable(mapTable); //释放掉map table所指向的内存,释放后不允许再访问map table,否则会发生访问不存在的地址的异常
        objectOne = [[NSObject alloc] init];
        mapKeyOne = @"mapKeyOne";
        [weakValueMapTable setObject:objectOne forKey:mapKeyOne];
        [weakKeyMapTable setObject:objectOne forKey:mapKeyOne];
        BOOL isEqual = NSCompareMapTables(weakKeyMapTable, weakValueMapTable);
        NSLog(@"isEqual:%d", isEqual);
        NSString *mapTableString = NSStringFromMapTable(weakKeyMapTable);
        NSLog(@"weakKeyMapTable:%@", mapTableString);
        NSArray *allKeys = NSAllMapTableKeys(weakKeyMapTable);
        NSArray *allValues = NSAllMapTableValues(weakKeyMapTable);
        NSLog(@"allKeys:%@, allValues:%@", allKeys, allValues);
//        NSMapTable *testMapTable = [NSMapTable strongToStrongObjectsMapTable];
//        CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
//        for (int i = 0; i < 1000000; i++) {
//            [testMapTable setObject:@(i) forKey:@(i)];
//        }
//        CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
//
//        NSLog(@"duration:%f", end - start);
//        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//        start = CFAbsoluteTimeGetCurrent();
//        for (int i = 0; i < 1000000; i++) {
//            [dictionary setObject:@(i) forKey:@(i)];
//        }
//        end = CFAbsoluteTimeGetCurrent();
//        NSLog(@"duration:%f", end - start);
    }
    return 0;
}
