//
//  Teacher.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
- (instancetype)initWithName:(NSString *)name className:(NSString *)className {
    self = [super init];
    if (self) {
        _name = [name copy];
        _className = [className copy];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@, className:%@,address:%p", _name, _className, self];
}


- (NSString *)debugDescription {
    NSString *debugDescription = [super debugDescription];
    return [debugDescription stringByAppendingFormat:@"name:%@,className:%@", _name, _className];
}

@end
