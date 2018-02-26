//
//  ViewController.m
//  CAPropertyAnimation
//
//  Created by jianghongbing on 2018/2/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectMake(10, 100, 100, 100);
    [self.view.layer addSublayer:redLayer];
    CABasicAnimation *animation = [CABasicAnimation animation];
    //CAPropertyAnimation:属性动画的抽象类,用于定义某个属性的动画,可以使用其具体类CABasicAnimation和CAKeyFrameAnimation来执行动画
    //1.设置属性动画的keyPath,对该属性执行动画
    animation.keyPath = @"position.x";
    animation.repeatCount = 3;
    animation.fromValue = @100;
    animation.toValue = @200;
    animation.duration = 1.0;
    //2.cumulative:如果动画的repeatCount是多次的时候,下一次的动画的开始状态是否以上一次动画结束的状态为起点,默认值为NO
    animation.cumulative = YES;
    [redLayer addAnimation:animation forKey:@"positionX"];
    
    CALayer *orangeLayer = [CALayer layer];
    orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    orangeLayer.frame = CGRectMake(100, 220, 100, 100);
    [self.view.layer addSublayer:orangeLayer];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotateAnimation.repeatCount = 3;
    rotateAnimation.duration = 0.5;
    //3.CAValueFunction:以一种灵活的方式定义CALayer的transform相关的动画,通过CAValueFunction可以在定义动画的时候,直接设置keyPath为transform,然后通过CAValueFunction来定义需要动画的具体属性,而不需要直接在定义动画的时候设置到具体的keyPath
    //CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //CAValueFunction *valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    //rotateAnimation.valueFunction = valueFunction;
    //上面的三行代码等同于CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //CAValueFunction支持的name:
    //kCAValueFunctionRotateX //围绕x轴旋转
    //kCAValueFunctionRotateY //围绕y轴旋转
    //kCAValueFunctionRotateZ //围绕z轴旋转
    //kCAValueFunctionScale //缩放动画keyPath,该选项包含3个方向的缩放,所以fromValue和toValue需要通过数组指定3个值
    //kCAValueFunctionScaleX //x方向缩放
    //kCAValueFunctionScaleY //y方向缩放
    //kCAValueFunctionScaleZ //z方向缩放
    //kCAValueFunctionTranslate //移动转移动画,该选项也包含3个方向的移动,所以fromValue和toValue需要通过数组指定3个值
    //kCAValueFunctionTranslateX //x方向移动
    //kCAValueFunctionTranslateY //y方向移动
    //kCAValueFunctionTranslateZ //z方向移动
    CAValueFunction *valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    rotateAnimation.valueFunction = valueFunction;
    rotateAnimation.fromValue = @0;
    rotateAnimation.toValue = @(M_PI_4 * 3);
    [orangeLayer addAnimation:rotateAnimation forKey:@"rotateZ"];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(30, 350, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:blueLayer];
    
    //4.additive:当一个layer上面执行多个动画时,默认执行最后一个添加的动画,如果需要多个动画同时执行可以将动画的additive的值设置为YES,将多个动画合成,默认值为NO
    CABasicAnimation *rotateZAnimation = rotateAnimation.copy;
    rotateZAnimation.repeatCount = CGFLOAT_MAX;
    rotateZAnimation.duration = 0.5;
    rotateZAnimation.fromValue = @0;
    rotateZAnimation.toValue = @(M_PI_4 * 3);
    rotateZAnimation.valueFunction = valueFunction;
    
    CABasicAnimation *scaleXYAnimation = rotateAnimation.copy;
    CAValueFunction *scaleValueFunction = [CAValueFunction functionWithName: kCAValueFunctionScale];
    scaleXYAnimation.valueFunction = scaleValueFunction;
    scaleXYAnimation.fromValue = @[@1.0, @1.0, @1.0];
    scaleXYAnimation.toValue = @[@0.5, @0.5, @1.0];
    scaleXYAnimation.duration = 0.5;
    scaleXYAnimation.additive = YES;
    
    scaleXYAnimation.repeatCount = CGFLOAT_MAX;
    
    [blueLayer addAnimation:rotateZAnimation forKey:@"rotateZ"];
    [blueLayer addAnimation:scaleXYAnimation forKey:@"scaleXY"];
}

@end
