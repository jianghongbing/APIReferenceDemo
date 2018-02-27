//
//  AnimationView.m
//  CAKeyframeAnimation
//
//  Created by pantosoft on 2018/2/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "AnimationView.h"
@interface NSArray(map)
- (NSArray *)map:(id(^)(id element))block;
@end
@implementation NSArray(map)
- (NSArray *)map:(id (^)(id))block {
    if (self == nil || self.count == 0) return nil;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        id mapObject = block(object);
        [array addObject:mapObject];
    }
    return array.copy;
}
@end


@interface AnimationView()
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@end
@implementation AnimationView

- (CALayer *)redLayer {
    if (_redLayer == nil) {
        _redLayer = [self createLayerWithColor:[UIColor redColor]];
    }
    return _redLayer;
}

- (CALayer *)greenLayer {
    if (_greenLayer == nil) {
        _greenLayer = [self createLayerWithColor:[UIColor greenColor]];
    }
    return _greenLayer;
}

- (CALayer *)blueLayer {
    if (_blueLayer == nil) {
        _blueLayer = [self createLayerWithColor:[UIColor blueColor]];
    }
    return _blueLayer;
}
- (CALayer *)createLayerWithColor:(UIColor *)color {
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 16, 16);
    layer.backgroundColor = color.CGColor;
    layer.cornerRadius = 8.0;
    [self.layer addSublayer:layer];
    return layer;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = CGRectGetWidth(self.bounds) / 3.0;
    CGFloat y = CGRectGetMidY(self.bounds);
    CGFloat redLayerPositionX = x * 0.5;
    self.redLayer.position = CGPointMake(redLayerPositionX, y);
    self.greenLayer.position = CGPointMake(redLayerPositionX + x, y);
    self.blueLayer.position = CGPointMake(redLayerPositionX + x * 2, y);
}


- (void)startAnimation {
    [self.redLayer addAnimation:[self redLayerAnimation] forKey:nil];
    [self.greenLayer addAnimation:[self greenLayerAnimation] forKey:nil];
    [self.blueLayer addAnimation:[self blueLayerAnimation] forKey:nil];
}
- (void)stopAnimation {
    [self.redLayer removeAllAnimations];
    [self.greenLayer removeAllAnimations];
    [self.blueLayer removeAllAnimations];
}


- (CAAnimation *)translateAnimationWithValues:(NSArray <NSNumber *> *)values keyTimes:(NSArray <NSNumber *> *)keyTimes {
    CAKeyframeAnimation *translateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    translateAnimation.values = values;
    translateAnimation.keyTimes = keyTimes;
    translateAnimation.duration = 1.5;
    translateAnimation.repeatCount = HUGE;
    return translateAnimation;
    
}

//- (CAAnimation *)rotateAnimationWithValues:(NSArray <NSNumber *> *)values keyTimes:(NSArray <NSNumber *> *)keyTimes {
//    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    rotateAnimation.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateX];
//    rotateAnimation.values = values;
//    rotateAnimation.keyTimes = keyTimes;
//    rotateAnimation.duration = 1.5;
//    rotateAnimation.repeatCount = HUGE;
//    return rotateAnimation;
//}

- (CAAnimation *)backgroundColorAnimationWithValues:(NSArray <UIColor *> *)values keyTimes:(NSArray<NSNumber *> *) keyTimes{
    CAKeyframeAnimation *backgroundColorAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    backgroundColorAnimation.values = [values map:^id(UIColor *color) {
        return (__bridge id)color.CGColor;
    }];
    backgroundColorAnimation.keyTimes = keyTimes;
    backgroundColorAnimation.duration = 1.5;
    backgroundColorAnimation.repeatCount = HUGE;
    return backgroundColorAnimation;
    
}

- (CAAnimation *)redLayerAnimation {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CAAnimation *backgroundeColorAnimation = [self backgroundColorAnimationWithValues:@[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor redColor]] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    CGFloat x = CGRectGetWidth(self.bounds) / 3.0;
    CGFloat redLayerPositionX = x * 0.5;
    CGFloat greenLayerPositionX = redLayerPositionX + x;
    CGFloat blueLayerPositionX = greenLayerPositionX + x;
    CAAnimation *translateAnimation = [self translateAnimationWithValues:@[@(redLayerPositionX), @(blueLayerPositionX), @(greenLayerPositionX), @(redLayerPositionX)] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    CAAnimation *zIndexAnimation = [self zIndexAnimationWithValues:@[@0, @100, @0, @0] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    
    group.duration = 1.5;
    group.repeatCount = HUGE;
    group.animations = @[translateAnimation, zIndexAnimation, backgroundeColorAnimation];
    return group;
}

- (CAAnimation *)greenLayerAnimation {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CAAnimation *backgroundeColorAnimation = [self backgroundColorAnimationWithValues:@[[UIColor greenColor], [UIColor blueColor], [UIColor redColor], [UIColor blueColor]] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    CAAnimation *zIndexAnimation = [self zIndexAnimationWithValues:@[@100, @0, @0, @0] keyTimes:@[@0, @0.25, @0.75, @1.0]];
    group.duration = 1.5;
    group.repeatCount = HUGE;
    group.animations = @[zIndexAnimation, backgroundeColorAnimation];
    return group;
}

- (CAAnimation *)blueLayerAnimation {
    CAAnimation *backgroundeColorAnimation = [self backgroundColorAnimationWithValues:@[[UIColor blueColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor]] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CGFloat x = CGRectGetWidth(self.bounds) / 3.0;
    CGFloat redLayerPositionX = x * 0.5;
    CGFloat greenLayerPositionX = redLayerPositionX + x;
    CGFloat blueLayerPositionX = greenLayerPositionX + x;
    CAAnimation *translateAnimation = [self translateAnimationWithValues:@[@(blueLayerPositionX), @(greenLayerPositionX), @(redLayerPositionX), @(blueLayerPositionX)] keyTimes:@[@0, @0.25, @0.5, @1.0]];
    CAAnimation *zIndexAnimation = [self zIndexAnimationWithValues:@[@0, @0, @100, @0] keyTimes:@[@0, @0.5, @0.75, @1.0]];
    group.duration = 1.5;
    group.repeatCount = HUGE;
    group.animations = @[translateAnimation, zIndexAnimation, backgroundeColorAnimation];
    return group;
}

- (CAAnimation *)zIndexAnimationWithValues:(NSArray<NSNumber *> *)values keyTimes:(NSArray<NSNumber *> *) keyTimes {
    CAKeyframeAnimation *zIndexAnimation = [CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
    zIndexAnimation.values = values;
    zIndexAnimation.keyTimes = keyTimes;
    zIndexAnimation.duration = 1.5;
    zIndexAnimation.repeatCount = HUGE;
    return zIndexAnimation;
}
@end

