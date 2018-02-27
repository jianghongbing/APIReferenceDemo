//
//  ViewController.m
//  CAKeyframeAnimation
//
//  Created by pantosoft on 2018/2/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
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
    CALayer *orangeLayer = [CALayer layer];
    orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    orangeLayer.frame = CGRectMake(100, 200, 30, 30);
    orangeLayer.cornerRadius = 15;
    [self.view.layer addSublayer:orangeLayer];
    [orangeLayer addAnimation:pathAnimation forKey:@"position"];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.bounds = CGRectMake(0, 0, 30, 30);
    blueLayer.position = CGPointMake(100, 400);
    blueLayer.cornerRadius = 15;
    [self.view.layer addSublayer:blueLayer];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 2.0;
    positionAnimation.repeatCount = HUGE;
    positionAnimation.keyTimes = @[@0, @0.25, @0.5, @0.75, @1.0];
    positionAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(100, 400)],
                                 [NSValue valueWithCGPoint:CGPointMake(200, 400)],
                                 [NSValue valueWithCGPoint:CGPointMake(200, 500)],
                                 [NSValue valueWithCGPoint:CGPointMake(100, 500)],
                                 [NSValue valueWithCGPoint:CGPointMake(100, 400)]];
    //5.CAMediaTimingFunction:动画的缓冲模式
    //timingFunctions:每一帧动画的缓冲模式,该数组的长度要比keyTimes的长度小1
    //kCAMediaTimingFunctionLinear:动画一直以线性的速度运行
    //kCAMediaTimingFunctionEaseIn:动画开始的时候缓慢加速进行,到达某个速度后,会保持该速度执行动画
    //kCAMediaTimingFunctionEaseOut:动画开始的时候以某个速度进行,在动画快要完成时,动画执行速度回逐渐减小,直到为0
    //kCAMediaTimingFunctionEaseInEaseOut:动画开始的时候缓慢加速进行,到达某个速度后,会保持该速度执行动画,在动画快要完成时,动画执行速度回逐渐减小,直到为0
    positionAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                          ];
    [blueLayer addAnimation:positionAnimation forKey:nil];
    AnimationView *animationView = [[AnimationView alloc] initWithFrame:CGRectMake(100, 520, 100, 60)];
    [self.view addSubview:animationView];
    [animationView startAnimation];
    

    
    CALayer *rotateLayer = [CALayer layer];
    rotateLayer.backgroundColor = [UIColor purpleColor].CGColor;
    rotateLayer.bounds = CGRectMake(0, 0, 30, 30);
    rotateLayer.position = self.view.center;
    [self.view.layer addSublayer:rotateLayer];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rotateAnimation.duration = 1.5;
    rotateAnimation.repeatCount = 3;
    UIBezierPath *rotateAnimationPath = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    rotateAnimation.path = rotateAnimationPath.CGPath;
    //6.rotationMode:当动画沿着某个path做运动时,layer的旋转模式,默认为nil,
    //kCAAnimationRotateAuto:如当layer沿着一个圆弧做动画时,会沿着path的切线旋转
    //kCAAnimationRotateAutoReverse:根据paht自动旋转
    rotateAnimation.rotationMode = kCAAnimationRotateAuto;
    [rotateLayer addAnimation:rotateAnimation forKey:nil];
    //用于调整动画的参数,具体的不是很明白
    //@property(nullable, copy) NSArray<NSNumber *> *tensionValues;
    //@property(nullable, copy) NSArray<NSNumber *> *continuityValues;
    //@property(nullable, copy) NSArray<NSNumber *> *biasValues;
}

@end
