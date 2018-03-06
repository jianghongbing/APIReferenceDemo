//
//  DrawPathView.m
//  CGContext
//
//  Created by pantosoft on 2018/3/6.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawPathView.h"

@implementation DrawPathView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathRelease(<#CGPathRef  _Nullable path#>)
    CGPathRelease(path);
    
    
}

@end
