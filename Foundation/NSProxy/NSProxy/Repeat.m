//
//  Repeat.m
//  NSProxy
//
//  Created by pantosoft on 2018/8/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Repeat.h"

@implementation Repeat
- (instancetype)initWithRepeatNumber:(NSUInteger)repeatNumber action:(void (^)(Repeat *))action {
    self = [super init];
    if (self) {
        _action = [action copy];
        _repeatNumber = repeatNumber;
    }
    return self;
}

- (void)excuteAction {
    
}

- (void)endAction {
    
}
@end
