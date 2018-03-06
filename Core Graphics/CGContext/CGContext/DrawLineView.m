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
    //11.设置线条两端的样式
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
    //12.一次性绘制多条线
    CGContextAddLines(ctx, points, sizeof(points) / sizeof(CGPoint));
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 10.0);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //13.设置两条线交互处边角的最大限制
    CGContextSetMiterLimit(ctx, 8);
    //14.设置两条线相交处边角的样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextMoveToPoint(ctx, 150, 200);
    CGContextAddLineToPoint(ctx, 200, 150);
    CGContextAddLineToPoint(ctx, 250, 200);
    CGContextStrokePath(ctx);
    
    CGContextSetLineJoin(ctx, kCGLineJoinMiter);
    CGContextMoveToPoint(ctx, 150, 220);
    CGContextAddLineToPoint(ctx, 200, 170);
    CGContextAddLineToPoint(ctx, 250, 220);
    CGContextStrokePath(ctx);
    
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextMoveToPoint(ctx, 150, 240);
    CGContextAddLineToPoint(ctx, 200, 190);
    CGContextAddLineToPoint(ctx, 250, 240);
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    //15.填充某个区域
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(10, 250, 100, 100));
    CGPoint linePoints[] = {
        CGPointMake(150, 250),
        CGPointMake(200, 350),
        CGPointMake(400, 300),
        
    };
    CGContextAddLines(ctx, linePoints, sizeof(linePoints) / sizeof(CGPoint));
    //16.关闭当前上下文的路径
    CGContextClosePath(ctx);
    //17.填充上下文
    CGContextFillPath(ctx);
    
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    //18.绘制虚线
    CGContextSetLineWidth(ctx, 10.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    //设置绘制虚线的参数
    CGFloat length[] = {10.0, 20.0, 30.0};
    CGFloat phase = 20.0;
    CGContextSetLineDash(ctx, phase, length, sizeof(length) / sizeof(CGFloat));
    //19.绘制某个区域
    CGContextStrokeRect(ctx, CGRectMake(10, 370, 100, 100));
    CGContextMoveToPoint(ctx, 200, 370);
    CGContextAddLineToPoint(ctx, 350, 370);
    CGContextStrokePath(ctx);
    
    
    //20.添加区域
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    CGContextSetLineWidth(ctx, 3.0);
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0);
    CGContextAddRect(ctx, CGRectMake(10, 500, 50, 50)); //添加一个区域
    CGRect rects[] = {
        CGRectMake(80, 500, 50, 50),
        CGRectMake(150, 500, 60, 60)
    };
    CGContextAddRects(ctx, rects, sizeof(rects) / sizeof(CGRect)); //添加多个区域
    CGContextStrokePath(ctx);
    
    
    //21.添加多条线段,两个点绘制一条线段,不会接着该条线段继续绘制另外一线段,会移动到下一个点,继续绘制
    CGPoint lineSegmentPoints[] = {
        CGPointMake(10, 680),
        CGPointMake(50, 600),
        CGPointMake(100, 680),
        CGPointMake(150, 600),
        CGPointMake(200, 680),
        CGPointMake(250, 600)
    };
    CGContextStrokeLineSegments(ctx, lineSegmentPoints, sizeof(lineSegmentPoints) / sizeof(CGPoint));
    //绘图的其他设置
//    CGContextSetFlatness(ctx, 1.0) //设置绘制的精确度
//    CGContextSetInterpolationQuality(ctx, kCGInterpolationLow)
//    CGContextSetShouldAntialias(ctx, YES);是否抗锯齿
//    CGContextSetAllowsAntialiasing(ctx, YES)
//    CGContextSetAllowsFontSmoothing(ctx, YES);//是否允许字体平滑
//    CGContextSetShouldSmoothFonts(ctx, YES); //是否字体平滑
}

@end
