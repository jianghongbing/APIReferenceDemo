//
//  CTMView.m
//  CGContext
//
//  Created by pantosoft on 2018/3/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "CTMView.h"

@implementation CTMView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 10.0);
    CGContextSaveGState(ctx);
    CGContextFillRect(ctx, CGRectMake(20, 100, 100, 100));
    //1.获取当前上下文的CTM
    CGAffineTransform transform = CGContextGetCTM(ctx);
    NSLog(@"transform:%@", NSStringFromCGAffineTransform(transform));
    //2.旋转CTM,先旋转CTM,在绘制,会旋转绘制的图形
    CGContextRotateCTM(ctx, M_PI_4);
    NSLog(@"transform:%@", NSStringFromCGAffineTransform(CGContextGetCTM(ctx)));
    CGContextFillRect(ctx, CGRectMake(300, 100, 100, 100));
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    //3.缩放CTM
    //相对于没有做任何旋转,移动,缩放时的CTM,此时绘制的rect的x为设置的值成在x轴缩放的比率(在本次demo中为100 * 0.5),y为100 * 0.8
    //width为100 * 0.5, height为100 * 0.8
    CGContextScaleCTM(ctx, 0.5, 0.8);
    NSLog(@"transform:%@", NSStringFromCGAffineTransform(CGContextGetCTM(ctx)));
    CGContextStrokeRect(ctx, CGRectMake(200, 150, 100, 100));
    
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    //4.移动CTM
    CGContextTranslateCTM(ctx, 50, -50);
    NSLog(@"transform:%@", NSStringFromCGAffineTransform(CGContextGetCTM(ctx)));
    //相对于没有做任何旋转,移动,缩放时的CTM,此时绘制的rect的x,y是在原有的基础上加上CTM的在x,y方向上的偏移量
    CGContextFillRect(ctx, CGRectMake(150, 250, 50, 50));
    
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    //5.合并CTM
    CGContextConcatCTM(ctx, CGAffineTransformMake(1.0, 0, 0, 1.0, 100, 100));
    NSLog(@"transform:%@", NSStringFromCGAffineTransform(CGContextGetCTM(ctx)));
    CGContextFillRect(ctx, CGRectMake(10, 300, 100, 100));
    CGContextRestoreGState(ctx);
}

@end
