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
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSaveGState(ctx);
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    CGPathMoveToPoint(mutablePath, NULL, 20, 100);
    CGPathAddLineToPoint(mutablePath, NULL, 120, 100);
    CGPathAddArc(mutablePath, NULL, 150, 150, 30, M_PI_2, M_PI_2 * 3 / 2, 1);
    CGContextAddPath(ctx, mutablePath);
    CGContextStrokePath(ctx);
    CGPathRelease(mutablePath);
}
@end
