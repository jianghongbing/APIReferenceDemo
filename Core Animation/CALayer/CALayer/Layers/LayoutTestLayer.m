//
//  LayoutTestLayer.m
//  CALayer
//
//  Created by pantosoft on 2018/1/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LayoutTestLayer.h"
@interface LayoutTestLayer()
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *orangeLayer;
@end
@implementation LayoutTestLayer
#pragma mark getter
- (CALayer *)redLayer {
    if (_redLayer == nil) {
        _redLayer = [CALayer layer];
        _redLayer.backgroundColor = [UIColor redColor].CGColor;
//        _redLayer.bounds = CGRectMake(0, 0, 20, 20);
        [self addSublayer:_redLayer];
    }
    return _redLayer;
}
- (CALayer *)orangeLayer {
    if (_orangeLayer == nil) {
        _orangeLayer = [CALayer layer];
        _orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
//        _orangeLayer.bounds = CGRectMake(0, 0, 40, 40);
        [self addSublayer:_orangeLayer];
    }
    return _orangeLayer;
}


#pragma mark initialize
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor blueColor].CGColor;
}

- (CGSize)preferredFrameSize {
    return CGSizeMake(200, 200);
}

- (void)layoutSublayers {
    [super layoutSublayers];
    NSLog(@"layoutSubLayers,frame:%@", NSStringFromCGRect(self.frame));
    self.redLayer.frame = CGRectMake(0, 0, self.bounds.size.width * 0.3, self.bounds.size.height * 0.3);
    CGFloat orangeLayerWidth = self.bounds.size.width * 0.5;
    CGFloat orangeLayerHeight = self.bounds.size.height * 0.5;
    CGFloat orangeLayerX = self.bounds.size.width - orangeLayerWidth;
    CGFloat orangeLayerY = self.bounds.size.height - orangeLayerHeight;
    self.orangeLayer.frame = CGRectMake(orangeLayerX, orangeLayerY, orangeLayerWidth, orangeLayerHeight);
}
@end
