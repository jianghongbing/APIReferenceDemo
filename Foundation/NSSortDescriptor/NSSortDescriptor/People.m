//
//  People.m
//  NSSortDescriptor
//
//  Created by jianghongbing on 2017/8/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "People.h"

@implementation People
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}
@end
