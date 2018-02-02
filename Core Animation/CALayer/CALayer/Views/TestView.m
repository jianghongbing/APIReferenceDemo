//
//  TestView.m
//  CALayer
//
//  Created by pantosoft on 2018/1/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestView.h"

@implementation TestView
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 8.0);
    CGContextAddRect(context, rect);
    CGContextFillPath(context);
    CGContextMoveToPoint(context, rect.size.width * 0.5, 10);
    CGContextAddLineToPoint(context, 10, rect.size.height - 20);
    CGContextAddLineToPoint(context, rect.size.width - 10, rect.size.height - 20);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

#pragma mark CALayerDelegate
- (void)layerWillDraw:(CALayer *)layer {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillRect(ctx, layer.bounds);
    CGFloat inset = 10.0;
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGRect rect = layer.bounds;
    while (rect.size.width > 0 && rect.size.height > 0) {
        CGContextAddRect(ctx, rect);
        rect = CGRectInset(rect, inset, inset);
    }
    CGContextStrokePath(ctx);
}

//- (void)displayLayer:(CALayer *)layer {
//    NSLog(@"func:%s, line:%d", __func__, __LINE__);
//    if (self.layer == layer) {
//        layer.contents = (id)[UIImage imageNamed:@"cat40x40"].CGImage;
//    }
//}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}


//- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
//    NSLog(@"func:%s, line:%d", __func__, __LINE__);
//    return nil;
//}


@end
