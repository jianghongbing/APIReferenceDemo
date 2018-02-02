//
//  AppearanceViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "AppearanceViewController.h"

@interface AppearanceViewController ()
@end

@implementation AppearanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置layer的外观
    //1.backgroundColor:背景色
    //2.borderColor:边框色
    //3.borderWidth:边框宽度
    //4.cornerRadius:圆角大小
    //5.hidden:是否隐藏图层
    //5.opacity:不透明度
    //6.opaque:是否为不透明
    //7.masksToBounds: 切除超过layer的bounds之外的内容.通过给layey加上一个不透明的和layer大小一样的遮罩层,来实现
    //8.shadow:阴影的颜色
    //9.shadowOffset: shadow在x和y方向的偏移量
    //10.shadowRadius:阴影圆角
    //11.shadowOpacity:阴影的不透明度
    //12.shadowPath:阴影的路径
    //13.maskedCorners:在指定的角的位置切圆角,默认为四个角,在iOS11之后支持
    //14.mask:遮罩,遮罩层和layer的重合的地方会显示出来,会将遮罩层的透明度加到layer上
    //15.contentsGravity:content排版方式,和viwe的UIViewContendMode类似
    //16.allowsGroupOpacity 是否继承父 layer 的透明度，主要用途是当在动画中改变一个 layer 的透明度时（会引起子 view 的透明度显示出来）。但是如果你不需要这种绘制类型，可以关闭这个属性来提高性能。
    //17. allowsEdgeAntialiasing:抗锯齿
    //18.shouldRasterize:光栅化
    //19.rasterizationScale:光栅化比例
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.borderColor = [UIColor blueColor].CGColor;
    redLayer.borderWidth = 2.0;
    redLayer.cornerRadius = 5.0;
    if (@available(iOS 11.0, *)) {
        redLayer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
    } else {
        
    }
    redLayer.frame = CGRectMake(50, 100, 150, 150);
//    redLayer.masksToBounds = YES;
//    redLayer.opaque = 0.5;
    redLayer.shadowColor = [UIColor blueColor].CGColor;
    redLayer.shadowOffset = CGSizeMake(0, 5);
    redLayer.shadowOpacity = 0.6;
    redLayer.shadowRadius = 3;
    [self.view.layer addSublayer:redLayer];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(-20, -30, 100, 100);
//    blueLayer.hidden = YES;
//    blueLayer.opaque = 0.0;
    [redLayer addSublayer:blueLayer];
    
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(20, 320, 200, 200);
    shadowLayer.backgroundColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowColor = [UIColor orangeColor].CGColor;
    shadowLayer.shadowOpacity = 1.0;
    shadowLayer.contents = (id)([UIImage imageNamed:@"cat40x40"].CGImage);
    shadowLayer.contentsScale = [UIScreen mainScreen].scale;
    
    shadowLayer.contentsGravity = kCAGravityCenter;
    CGRect rect = CGRectMake(-10, -10, CGRectGetWidth(shadowLayer.frame) + 20, CGRectGetHeight(shadowLayer.frame) + 20);
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectOffset(shadowLayer.bounds, -10, 10)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:rect];
    shadowLayer.shadowPath = bezierPath.CGPath;
    shadowLayer.doubleSided = NO;
    shadowLayer.opaque = NO;
    shadowLayer.allowsGroupOpacity = YES;
    shadowLayer.allowsEdgeAntialiasing = YES;
    [self.view.layer addSublayer:shadowLayer];
    
    
//    CALayer *orangeLayer = [CALayer layer];
//    orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
//    orangeLayer.frame = CGRectMake(230, 100, 100, 100);
//    orangeLayer.contents = (id)[UIImage imageNamed:@"cat40x40"].CGImage;
//    [self.view.layer addSublayer:orangeLayer];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 100, 100, 100)];
//    imageView.image = [UIImage imageNamed:@"cat40x40"];
//    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(230, 100, 100, 40)];
    label.text = @"123456789";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectInset(label.bounds, 20, 0);
    maskLayer.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
//    maskLayer.contents = (id)[UIImage imageNamed:@"dog"].CGImage;
    label.layer.mask = maskLayer;
    
//    UIView *redViewOne = [[UIView alloc] initWithFrame:CGRectMake(20, 550, 100, 40)];
//    redViewOne.backgroundColor = [UIColor redColor];
//    redViewOne.alpha = 0.5;
//    [self.view addSubview:redViewOne];
//
//    UIView *blueViewOne = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 60, 20)];
//    blueViewOne.backgroundColor = [UIColor blueColor];
//    [redViewOne addSubview:blueViewOne];
//
//    UIView *redViewTwo = [[UIView alloc] initWithFrame:CGRectMake(150, 550, 100, 40)];
//    redViewTwo.backgroundColor = [UIColor redColor];
//    redViewTwo.alpha = 0.5;
//    [self.view addSubview:redViewTwo];
//
//    UIView *blueViewTwo = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 60, 20)];
//    blueViewTwo.backgroundColor = [UIColor blueColor];
//    blueViewTwo.layer.shouldRasterize = YES;
//    blueViewTwo.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    [redViewTwo addSubview:blueViewTwo];
}
@end
