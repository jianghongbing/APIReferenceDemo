//
//  DrawLineView.m
//  CGContext
//
//  Created by pantosoft on 2018/3/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView


- (void)drawRect:(CGRect)rect {
    //1.获取当前上下文CGContextRef
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.保存当前的状态
    CGContextSaveGState(ctx);
    //3.设置线条颜色
//    CGContextSetStrokeColor(ctx, nil)
//    CGContextSetStrokeColorSpace(ctx, nil)
//    CGContextSetStrokePattern(ctx, nil, nil)
//    CGContextSetRGBStrokeColor(ctx, 0, 0, 0, .5)
//    CGContextSetCMYKStrokeColor(ctx, 0, 0, 0, 0, 0)
//    CGContextSetGrayStrokeColor(ctx, 1, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    //4.设置区域的填充颜色
//    CGContextSetFillColor(ctx, nil)
//    CGContextSetStrokeColorSpace(ctx, nil)
//    CGContextSetFillPattern(ctx, nil, nil)
//    CGContextSetRGBFillColor(ctx, 0, 0, 0, 0)
//    CGContextSetCMYKFillColor(ctx, 0, 0, 0, 0, 1.0)
//    CGContextSetGrayFillColor(ctx, 0, 0)
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    //5.设置线条宽度
    CGContextSetLineWidth(ctx, 10.0);
    //7.移动到某个点
    CGContextMoveToPoint(ctx, 10, 100);
    //8.添加线,从当前点到指定的点
    CGContextAddLineToPoint(ctx, 150, 100);
    //9.绘制上下文
    CGContextStrokePath(ctx);
    //10.恢复到之前保存的上下文
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 10.0);
    CGContextMoveToPoint(ctx, 10, 130);
    CGContextAddLineToPoint(ctx, 110, 130);
    CGContextStrokePath(ctx);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextMoveToPoint(ctx, 10, 150);
    CGContextAddLineToPoint(ctx, 110, 150);
    CGContextStrokePath(ctx);
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    CGContextMoveToPoint(ctx, 10, 170);
    CGContextAddLineToPoint(ctx, 110, 170);
    CGContextStrokePath(ctx);
    
    CGPoint points[] = {
        CGPointMake(10, 190),
        CGPointMake(110, 190),
        CGPointMake(10, 210),
        CGPointMake(110, 210)
    };
    //11.一次性绘制多条线
    CGContextAddLines(ctx, points, sizeof(points) / sizeof(CGPoint));
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    
    
    
}

@end
