//
//  ViewController.m
//  CAKeyframeAnimation
//
//  Created by pantosoft on 2018/2/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CAKeyframeAnimation:关键帧动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    //1.values:每一帧动画,keyPath对应的值
    keyframeAnimation.values = @[@50, @150, @100, @50];
    //2.keyTimes:每一帧动画的步调,表示当前帧动画所在的整个动画的位置
    keyframeAnimation.keyTimes = @[@0, @0.5, @0.75, @1.0];
    keyframeAnimation.duration = 1.0;
    keyframeAnimation.repeatCount = HUGE;
    
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.bounds = CGRectMake(0, 0, 100, 100);
    redLayer.position = CGPointMake(50, 100);
    [self.view.layer addSublayer:redLayer];
    [redLayer addAnimation:keyframeAnimation forKey:@"positionX"];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(100, 200, 200, 200)];
    //3.path:指定keyPath会沿着path的路径来执行动画
    pathAnimation.path = bezierPath.CGPath;
    pathAnimation.duration = 4.0;
    pathAnimation.repeatCount = 3.0;
    //4.calculationMode:动画运行时运算模式
    pathAnimation.calculationMode = kCAAnimationPaced;
    //CATimingFunctions:

    pathAnimation.timingFunctions = @[];
    
    
    CALayer *orangeLayer = [CALayer layer];
    orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    orangeLayer.frame = CGRectMake(100, 200, 30, 30);
    orangeLayer.cornerRadius = 15;
    [self.view.layer addSublayer:orangeLayer];
    [orangeLayer addAnimation:pathAnimation forKey:@"position"];
    
    
    
    
    
    
    
    
    
}

@end
