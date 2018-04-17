//
//  Person+Work.m
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person+Work.h"

@implementation Person (Work)
+ (void)load {
    NSLog(@"category load, categoryName:Person(Work)");
}

- (void)doSomething {
    NSLog(@"do something three");
}
@end
