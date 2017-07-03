//
//  ViewController.m
//  NSHashTable
//
//  Created by jianghongbing on 2017/6/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
@interface ViewController ()
@property (nonatomic,strong) NSHashTable *waekHashTable;
@property (nonatomic,strong) NSHashTable *strongHashTable;
@property (nonatomic,strong) NSHashTable *copyingHashTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSHashTable:可变的,无序的,没有重复元素,可以不对其中元素进行强引用的集合(与NSSet功能类似)

    //1.hashTable的创建
    //2.常见的几个NSPointerFunctionsOptions
    //2.1 NSPointerFunctionsStrongMemory:默认选项,hashTable会对其中的元素进行强引用
    //2.2 NSPointerFunctionsWeakMemory:对其中的元素进行弱引用
    //2.3 NSPointerFunctionsCopyIn:对添加的元素进行copy操作
    [self weakHashTableTest];
    [self strongHashTableTest];
    [self copyingHashTableTest];

    //NSHashTable的其他操作(和NSMutableSet的用法基本相同)
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];

    for (int i = 0; i < 10; i++) {
        NSString *index = [NSString stringWithFormat:@"%d", i];
        TestObject *obj = [[TestObject alloc] initWithName:index];
        //3.添加元素
        [hashTable addObject:obj];
    }

    //4.count
    NSUInteger count = hashTable.count;
    NSLog(@"count:%ld", count);

    //5.和另外一个hashTable是否有交集,是否相等,是否是另外的一个子集
    BOOL isIntersects = [hashTable intersectsHashTable:self.strongHashTable];
    BOOL isEqualTo = [hashTable isEqualToHashTable:self.strongHashTable];
    BOOL isSubSet = [self.strongHashTable isSubsetOfHashTable:hashTable];
    NSLog(@"isIntersects:%d, isEqualTo:%d, isSubSet:%d", isIntersects, isEqualTo, isSubSet);

    //6.交集,并集
    [hashTable unionHashTable:self.strongHashTable]; //并集
    NSLog(@"hashTable:%@", hashTable);
    [hashTable minusHashTable:self.strongHashTable]; //移除另外一个hashTable也存在的元素
    NSLog(@"hashTable:%@", hashTable);
//    [hashTable intersectHashTable:self.strongHashTable];//交集
//    NSLog(@"hashTable:%@", hashTable);

    //7.枚举器
    NSEnumerator *enumrator = hashTable.objectEnumerator;
    TestObject *elememt;
    while (elememt = [enumrator nextObject]) {
        NSLog(@"element:%@", elememt);
        if ([elememt.name isEqualToString:@"5"]) break;
    }

    //8.all Objects
    NSArray *allObjects = hashTable.allObjects;
    [allObjects enumerateObjectsUsingBlock:^(TestObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"object:%@",obj.name);
    }];

    //9.anyObject

    id any = hashTable.anyObject;
    //10.判断是否存在某个元素和移除元素
    if ([hashTable containsObject:any]) {
        [hashTable removeObject:any];
    }

    //11.以NSSet的形式呈现
    NSSet *set = hashTable.setRepresentation;
    NSLog(@"set:%@",set);
    //12.移除所有的元素
    [hashTable removeAllObjects];
}



- (void)weakHashTableTest {
    //1.不强引用元素的hashTable的创建,当其中的元素所指向的内存被系统回收后,会自动移除该元素
    self.waekHashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    //self.hashTable = [NSHashTable weakObjectsHashTable]; //效果同上面一样
    TestObject *obj = [[TestObject alloc] initWithName:@"123"];
    //3.添加元素
    [self.waekHashTable addObject:obj];
}


- (void)strongHashTableTest {
    //强引用其内部的元素的hashTable和NSMutableSet相似,用法也相似
    self.strongHashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
    TestObject *objOne = [[TestObject alloc] initWithName:@"11"];
    NSLog(@"strongObject:%@", objOne);
    [self.strongHashTable addObject:objOne];
    TestObject *objTwo = objOne;
    [self.strongHashTable addObject:objTwo];




}

- (void)copyingHashTableTest {
    //copyIn的hashTable的元素需要遵循NSCopying协议,会将添加的元素复制一份,然后放到table中
    self.copyingHashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsCopyIn];
    TestObject *objOne = [[TestObject alloc] initWithName:@"123"];
    NSLog(@"copyingObject:%@", objOne);
    [self.copyingHashTable addObject:objOne];
    [self.copyingHashTable addObject:objOne];
}

- (IBAction)logHashTable:(id)sender {
    NSLog(@"weakHashTable:%@", self.waekHashTable);
    NSLog(@"strongHashTable:%@", self.strongHashTable);
    NSLog(@"copyingHashTable:%@", self.copyingHashTable);
}

@end
