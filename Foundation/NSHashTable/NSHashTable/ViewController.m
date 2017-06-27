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
    [self strongHashTable];


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

}

- (IBAction)logHashTable:(id)sender {
    NSLog(@"weakHashTable:%@", self.waekHashTable);
    NSLog(@"strongHashTable:%@", self.strongHashTable);
    NSLog(@"copyingHashTable:%@", self.copyingHashTable);
}

@end
