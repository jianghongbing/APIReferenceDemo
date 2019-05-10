//
//  CustomTextView.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/10.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
}

@end
