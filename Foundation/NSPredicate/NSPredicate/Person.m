//
//  Person.m
//  NSPredicate
//
//  Created by pantosoft on 2017/8/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}
@end
