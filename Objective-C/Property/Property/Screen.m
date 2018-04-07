//
//  Screen.m
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Screen.h"

@implementation Screen
@synthesize width = _width;
- (instancetype)initWithWidth:(CGFloat)width
                       height:(CGFloat)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return self;
}

- (void)setWidth:(CGFloat)width {
    NSLog(@"func:%@", NSStringFromSelector(_cmd));
    _width = width;
}

- (CGFloat)width {
    NSLog(@"func:%@", NSStringFromSelector(_cmd));
    return _width;
}


- (void)display {
    NSLog(@"show screen");
}

- (void)close {
    NSLog(@"close screen");
}
@end
