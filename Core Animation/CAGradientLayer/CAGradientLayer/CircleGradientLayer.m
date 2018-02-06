//
//  CircleGradientLayer.m
//  CAGradientLayer
//
//  Created by pantosoft on 2018/2/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "CircleGradientLayer.h"
@interface CircleGradientLayer()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CAGradientLayer *leftGradientLayer;
@property (nonatomic, strong) CAGradientLayer *rightGradientLayer;
@end
@implementation CircleGradientLayer
#pragma mark getter
- (CAShapeLayer *)shapeLayer {
    if (_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 10.0;
        _shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.strokeStart = 0;
        self.mask = _shapeLayer;
    }
    return _shapeLayer;
}

- (CAGradientLayer *)leftGradientLayer {
    if (_leftGradientLayer == nil) {
        _leftGradientLayer = [CAGradientLayer layer];
        _leftGradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor];
        [self addSublayer:_leftGradientLayer];
    }
    return _leftGradientLayer;
}

- (CAGradientLayer *)rightGradientLayer {
    if (_rightGradientLayer == nil) {
        _rightGradientLayer = [CAGradientLayer layer];
        _rightGradientLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor];
        [self addSublayer:_rightGradientLayer];
    }
    return _rightGradientLayer;
}

- (void)setProgress:(CGFloat)progress {
    CGFloat finalProress = progress;
    if (finalProress < 0) {
        finalProress = 0;
    }else if (finalProress > 1) {
        finalProress = 1;
    }
    _progress = finalProress;
    self.shapeLayer.strokeEnd = _progress;
}

- (void)layoutSublayers {
    [super layoutSublayers];
    self.leftGradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
    self.rightGradientLayer.frame = CGRectMake(self.bounds.size.width * 0.5, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
    self.shapeLayer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:30 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
    self.shapeLayer.path = path.CGPath;
}

@end
