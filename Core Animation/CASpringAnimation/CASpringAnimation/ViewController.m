//
//  ViewController.m
//  CASpringAnimation
//
//  Created by pantosoft on 2018/2/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CASpringAnimation:弹簧动画
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = CGRectMake(150, 100, 200, 40);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:redLayer];
    
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"position.x"];
    springAnimation.duration = 1.0;
    springAnimation.repeatCount = HUGE;
    springAnimation.fromValue = @(redLayer.position.x - 50);
    springAnimation.byValue = @100;
    //1.mass:质量,质量越大,惯性越大,拉伸或者压缩的效果越明显,默认值是1
    springAnimation.mass = 20;
    //2.硬度系数:系数越大,产生形变的力就越大,运动就越快.默认值是100
    springAnimation.stiffness = 100;
    //3.阻尼系数,系数越大,弹簧运动停止的越快.默认值是10
    springAnimation.damping = 10;
    //4.动画初始速度,默认为0
    springAnimation.initialVelocity = 1;
    //5.获取弹簧动画到停止时的预估时间,根据当前的动画参数估算
    NSLog(@"duration:%f", springAnimation.settlingDuration);
    [redLayer addAnimation:springAnimation forKey:nil];
    
}

@end
