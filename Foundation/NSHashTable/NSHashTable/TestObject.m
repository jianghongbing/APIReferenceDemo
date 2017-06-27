//
//  TestObject.m
//  NSHashTable
//
//  Created by jianghongbing on 2017/6/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
@end
