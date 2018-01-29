//
//  DrawLayer.m
//  CALayer
//
//  Created by pantosoft on 2018/1/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawLayer.h"
@implementation DrawLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        _fillColor = [UIColor blackColor];
        _strokeColor = [UIColor orangeColor];
//        self.opaque = YES;
    }
    return self;
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}


- (void)drawInContext:(CGContextRef)ctx {
    NSLog(@"function:%s", __func__);
    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextFillRect(ctx, self.bounds);
    CGContextRestoreGState(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, self.strokeColor.CGColor);
    CGContextSetLineWidth(ctx, 5.0);
    CGRect rect = self.bounds;
    while (rect.size.width > 0 && rect.size.height > 0) {
        CGContextAddRect(ctx, rect);
        rect = CGRectInset(rect, 10, 10);
    }
    CGContextStrokePath(ctx);
}
@end
