//
//  ReadwriteTest.m
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ReadwriteTest.h"

@implementation ReadwriteTest
- (instancetype)initWithName:(NSString *)name identifier:(NSString *)identifier {
    self = [super init];
    if (self) {
        _name = name.copy;
        _identifier = identifier.copy;
    }
    return self;
}

@end
