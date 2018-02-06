//
//  BarGradientLayer.m
//  CAGradientLayer
//
//  Created by pantosoft on 2018/2/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "BarGradientLayer.h"
@interface BarGradientLayer()
@property (nonatomic, strong) CALayer *maskLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end
@implementation BarGradientLayer
#pragma mark getter
- (CALayer *)maskLayer {
    if (_maskLayer == nil) {
        _maskLayer = [CALayer layer];
        _maskLayer.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    }
    return _maskLayer;
}

- (CAGradientLayer *)gradientLayer {
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor greenColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
        _gradientLayer.locations = @[@0.25, @0.5, @0.75];
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1, 0.5);
        _gradientLayer.frame = self.bounds;
        [self addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

- (void)setProgress:(CGFloat)progress {
    CGFloat barProgress = progress;
    if (progress < 0) {
        barProgress = 0;
    }else if (barProgress > 1) {
        barProgress = 1;
    }
    _progress = barProgress;
    [self setNeedsLayout];
}

#pragma mark layout sublayers
- (void)layoutSublayers {
    [super layoutSublayers];
    self.gradientLayer.frame = self.bounds;
    CGRect maskLayerFrame = CGRectMake(0, 0, self.bounds.size.width * self.progress, self.bounds.size.height);
    self.maskLayer.frame = maskLayerFrame;
    self.mask = self.maskLayer;
}
@end
