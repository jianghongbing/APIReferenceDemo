//
//  ViewController.m
//  CAGradientLayer
//
//  Created by pantosoft on 2018/2/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "BarGradientLayer.h"
#import "CircleGradientLayer.h"
@interface ViewController ()
@property (nonatomic, strong) BarGradientLayer *barGradientLayer;
@property (nonatomic, strong) CircleGradientLayer *circleGradientLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) float progress;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //CAGradientLayer:渐变色图层
    
    CAGradientLayer *gradientLayerOne = [CAGradientLayer layer];
    gradientLayerOne.frame = CGRectMake(20, 100, 100, 150);
    //1.colors:渐变色数组,layer渐变的颜色顺序
    gradientLayerOne.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (__bridge id)UIColor.blueColor.CGColor];
    //2.locations:颜色开始渐变的位置,里面的值只能单调递增
    //如下:0.3表示:红色开始渐变的位置,0.5表示绿色开始渐变的位置,0.7表示蓝色开始渐变的位置
    //如果colors的数量多于locations的数量时,多的颜色不会向下渐变,最后一个位置对应的颜色会一直渐变到layer的底部,可能会出现有的颜色显示不出来的状况
    //如果colors的数量少于locations的数量,最后一个颜色会一直渐变到layer的底部,不会和其他颜色发生合成的状况
    
    gradientLayerOne.locations = @[@0.3, @0.5, @0.7];
    [self.view.layer addSublayer:gradientLayerOne];
    
    CAGradientLayer *gradientLayerTwo = [CAGradientLayer layer];
    gradientLayerTwo.frame = CGRectMake(150, 100, 100, 150);
    gradientLayerTwo.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (__bridge id)UIColor.blueColor.CGColor, (__bridge id)UIColor.yellowColor.CGColor];
    gradientLayerTwo.locations = @[@0.3, @0.5];
    [self.view.layer addSublayer:gradientLayerTwo];
    
    CAGradientLayer *gradientLayerThree = [CAGradientLayer layer];
    gradientLayerThree.frame = CGRectMake(270, 100, 100, 150);
    gradientLayerThree.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (id)UIColor.blueColor.CGColor];
    gradientLayerThree.locations = @[@0.3, @0.5, @0.7, @0.9];
    [self.view.layer addSublayer:gradientLayerThree];
    //3.startPoint和endPoint:渐变的起始点和结束点,决定了渐变的方向,
    //startPoint默认的值为(0.5, 0), endPoint默认的值为(0.5,1),也就是沿着Y轴方向渐变
    CAGradientLayer *gradientLayerFour = [CAGradientLayer layer];
    gradientLayerFour.frame = CGRectMake(20, 270, 100, 150);
    gradientLayerFour.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (__bridge id)UIColor.blueColor.CGColor];
    gradientLayerFour.locations = @[@0.3, @0.5, @0.7];
    //下面这个沿着对角线开始渐变
    gradientLayerFour.startPoint = CGPointMake(0, 0);
    gradientLayerFour.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayerFour];
    
    CAGradientLayer *gradientLayerFive = [CAGradientLayer layer];
    gradientLayerFive.frame = CGRectMake(150, 270, 100, 150);
    gradientLayerFive.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (__bridge id)UIColor.blueColor.CGColor];
    gradientLayerFive.locations = @[@0.3, @0.5, @0.7];
    //沿着y轴渐变
    gradientLayerFive.startPoint = CGPointMake(0, 0);
    gradientLayerFive.endPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:gradientLayerFive];
    
    CAGradientLayer *gradientLayerSix = [CAGradientLayer layer];
    gradientLayerSix.frame = CGRectMake(270, 270, 100, 150);
    gradientLayerSix.colors = @[(__bridge id)UIColor.redColor.CGColor, (__bridge id)UIColor.greenColor.CGColor, (__bridge id)UIColor.blueColor.CGColor];
    gradientLayerSix.locations = @[@0.3, @0.5, @0.7];
    //沿着x轴渐变
    gradientLayerSix.startPoint = CGPointMake(0, 0);
    gradientLayerSix.endPoint = CGPointMake(1, 0);
    [self.view.layer addSublayer:gradientLayerSix];
    
    BarGradientLayer *barGradientLayer = [BarGradientLayer layer];
    barGradientLayer.frame = CGRectMake(20, 450, 200, 10);
    barGradientLayer.progress = 0.5;
    [self.view.layer addSublayer:barGradientLayer];
    self.barGradientLayer = barGradientLayer;
    
    CircleGradientLayer *circleGradientLayer = [CircleGradientLayer layer];
    circleGradientLayer.frame = CGRectMake(20, 500, 100, 100);
    [self.view.layer addSublayer:circleGradientLayer];
    self.circleGradientLayer = circleGradientLayer;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}


- (void)updateProgress:(NSTimer *)timer {
    self.progress += 0.1;
    if (self.progress > 1) {
        self.progress = 0;
    }
    [self.barGradientLayer setProgress:self.progress];
    [self.circleGradientLayer setProgress:self.progress];
}

@end
