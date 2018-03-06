//
//  DrawCurveLineView.m
//  CGContext
//
//  Created by pantosoft on 2018/3/6.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawCurveLineView.h"

@implementation DrawCurveLineView
- (void)drawRect:(CGRect)rect {
    //绘制曲线
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextRestoreGState(ctx);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    //1.绘制一个椭圆,如果区域的size,长度和宽度相等则为一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 80, 50, 50));
    CGContextStrokePath(ctx);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(100, 80, 50, 40));
    CGContextFillEllipseInRect(ctx, CGRectMake(180, 80, 40, 60));
    //2.绘制一段圆弧
    //以设置的点为圆心,和半径以及设置的弧度画圆弧
    CGContextAddArc(ctx, 60, 250, 50, 0, M_PI_2, NO);
    CGContextStrokePath(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextAddArc(ctx, 60, 250, 50, M_PI, M_PI_2 * 3, NO);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 180, 250, 50, 0, M_PI_2, NO);
    CGContextAddArc(ctx, 180, 250, 50, M_PI_2 * 3, M_PI, YES);
    CGContextStrokePath(ctx);
    //3.通过切线来绘制圆弧
    CGPoint startPoint = CGPointMake(100, 350);
    CGPoint controlPointOne = CGPointMake(100, 400);
    CGPoint controlPointTwo = CGPointMake(150, 400);
    
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddArcToPoint(ctx, controlPointOne.x, controlPointOne.y, controlPointTwo.x, controlPointTwo.y, 50);
    CGContextStrokePath(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGPoint points[] = {
        startPoint, controlPointOne, controlPointTwo
    };
    CGContextAddLines(ctx, points, sizeof(points) / sizeof(CGPoint));
    CGContextStrokePath(ctx);
    //4.绘制贝塞尔曲线
    CGContextMoveToPoint(ctx, 50, 450);
    CGContextAddCurveToPoint(ctx, 100, 450 - 80, 200, 450 + 50, 250, 450);
    CGContextStrokePath(ctx);
    
    //5.绘制抛物线
    CGContextMoveToPoint(ctx, 50, 550);
    CGContextAddQuadCurveToPoint(ctx, 150, 650, 300, 400);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
}


@end
