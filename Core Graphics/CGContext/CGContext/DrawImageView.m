//
//  DrewImageView.m
//  CGContext
//
//  Created by pantosoft on 2018/3/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawImageView.h"

@implementation DrawImageView

- (void)drawRect:(CGRect)rect {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //1.绘制图片,以填冲的形式来绘制
    CGContextDrawImage(ctx, CGRectMake(20, 80, image.size.width, image.size.height), image.CGImage);
    CGContextDrawImage(ctx, CGRectMake(120, 80, 200, 200), image.CGImage);
    
    CGRect tiledImageRect = CGRectMake(20, 300, rect.size.width - 40, rect.size.height - 300 - 10);
    //2.将绘制的区域固定在指定的区域,相当于裁剪到指定区域之外的区域
    CGContextClipToRect(ctx, tiledImageRect);
    //3.以平铺的形式来绘制图片,默认会平铺整个上下区域
    CGContextDrawTiledImage(ctx, CGRectMake(10, 10, image.size.width, image.size.height), image.CGImage);
    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 0.5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 3.0);
    CGContextFillRect(ctx, CGRectMake(10, 10, image.size.width, image.size.height));
    CGRect clipRect = CGContextGetClipBoundingBox(ctx);
    CGContextStrokeRect(ctx, clipRect);
    CGContextDrawPDFPage(ctx, NULL);
}
@end
