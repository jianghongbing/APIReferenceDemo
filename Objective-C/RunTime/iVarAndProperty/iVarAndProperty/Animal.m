//
//  Animal.m
//  iVarAndProperty
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Animal.h"

@implementation Animal
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age weight:(float)weight {
    self = [super init];
    if (self) {
        _name = name.copy;
        _age = age;
        _weight = weight;
    }
    return self;
}
@end
