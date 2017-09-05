//
//  Person.m
//  NSPredicate
//
//  Created by pantosoft on 2017/8/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    self = [super init];
    if (self) {
        _firstName = [firstName copy];
        _lastName = [lastName copy];
        _age = age;
    }
    return self;
}
@end
