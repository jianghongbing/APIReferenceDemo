//
//  Person.m
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/10.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age brithday:(NSDate *)brithday {
    self = [super init];
    if (self) {
        _name = name.copy;
        _age = age;
        _brithday = brithday;
    }
    return self;
}
@end
