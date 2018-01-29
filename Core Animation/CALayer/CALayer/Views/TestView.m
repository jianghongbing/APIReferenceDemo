//
//  TestView.m
//  CALayer
//
//  Created by pantosoft on 2018/1/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestView.h"

@implementation TestView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}

#pragma mark CALayerDelegate
- (void)layerWillDraw:(CALayer *)layer {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}

- (void)displayLayer:(CALayer *)layer {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    NSLog(@"func:%s, line:%d", __func__, __LINE__);
}


//- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
//    NSLog(@"func:%s, line:%d", __func__, __LINE__);
//    return nil;
//}


@end
