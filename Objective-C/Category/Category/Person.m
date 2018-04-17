//
//  Person.m
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name.copy;
    }
    return self;
}
+ (void)load {
    NSLog(@"Person primary class load");
}

- (void)doSomething {
    NSLog(@"do something one");
}

@end
