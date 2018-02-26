//
//  ViewController.m
//  CABasicAnimation
//
//  Created by jianghongbing on 2018/2/13.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CABasicAnimation:基础动画
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectMake(100, 100, 100, 100);
    [self.view.layer addSublayer:redLayer];

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //1.fromValue:设置动画开始时候属性的值
    basicAnimation.fromValue = @100;
    //2.toValue:设置动画结束时候属性的值
    basicAnimation.toValue = @250;
    //3.byValue:设置动画过程中属性的增加值
    basicAnimation.byValue = @100;
    
    //4,动画开始值和结束值计算的规则
    //4.1 如果fromValue和toValue不为nil, 动画的开始值为fromValue, 动画的结束值为toValue
    //4.2 如果byValue和toValue不为nil, 动画的开始值为toValue - byValue, 动画的结束值为toValue
    //4.3 如果fromValue和byValue不为空,动画的开始值为fromValue, 结束值为fromValue + byValue
    //4.4 如果fromValue不为空,动画的开始值为fromValue,结束值为layer对应keyPath的值
    //4.5 如果toValue不为空,动画的开始值为layer对应keyPath的值,结束值为toValue
    //4.6 如果byValue不为空,动画的开始值为layer对应keyPath的值,结束值为layer对应keyPath的值加上byValue
    //4.7 如果fromValue, toValue, byValue都为nil,动画的开始值为layer对应的keyPath之前的值,结束值为当前layer对应的keyPath的值
    redLayer.duration = 0.5;
    redLayer.repeatCount = CGFLOAT_MAX;
    [redLayer addAnimation:basicAnimation forKey:@"positionX"];
    
}
@end
