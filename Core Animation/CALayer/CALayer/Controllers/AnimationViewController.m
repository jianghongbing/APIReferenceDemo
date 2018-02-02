//
//  AnimationViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, copy) NSString *animationKey;

@end

@implementation AnimationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationLayer = [CALayer layer];
    self.animationLayer.backgroundColor = [UIColor redColor].CGColor;
    self.animationLayer.frame = CGRectMake(50, 100, 100, 100);
    [self.view.layer addSublayer:self.animationLayer];
    self.animationKey = @"positionX";
    
//    [self.animationLayer actionForKey:nil];
    
    //actionForKey:用于自定义某些key的行为,如重载对应key的隐式动画
    
}
- (IBAction)addAnimation:(id)sender {
    CAAnimation *animation = [self.animationLayer animationForKey:self.animationKey];
    NSLog(@"animation:%@", animation);
    if (animation) return;
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.fromValue = @(self.animationLayer.position.x);
    basicAnimation.toValue = @(self.animationLayer.position.x + 100);
    basicAnimation.repeatCount = CGFLOAT_MAX;
    basicAnimation.duration = 0.8;
    //添加动画到layer上
    [self.animationLayer addAnimation:basicAnimation forKey:self.animationKey];
    
    
}

- (IBAction)removeAnimation:(id)sender {
    //移除layer的所有动画
//    [self.animationLayer removeAllAnimations];
    //移除指定key的动画
    CAAnimation *animation = [self.animationLayer animationForKey:self.animationKey];
    if (animation) {
        [self.animationLayer removeAnimationForKey:self.animationKey];
    }
}

@end
