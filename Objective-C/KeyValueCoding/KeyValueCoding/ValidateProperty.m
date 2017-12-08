//
//  ValidateProperty.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/7.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ValidateProperty.h"

@implementation ValidateProperty
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                       score:(float)score {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _score = score;
    }
    return self;
}

- (BOOL)validateName:(id __autoreleasing *)ioValue error:(NSError * __autoreleasing *)error{
    if (*ioValue == nil || ![*ioValue isKindOfClass:[NSString class]] || [(NSString *)(*ioValue) length] == 0) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"TestDomain" code:101 userInfo:@{NSLocalizedDescriptionKey: @"test value is invalid"}];
        }
        return NO;
    }
    return YES;
}
@end
