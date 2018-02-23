//
//  ViewController.m
//  CAPropertyAnimation
//
//  Created by jianghongbing on 2018/2/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CALayer *redLayer;
@end

@implementation ViewController
- (CALayer *)redLayer {
    if (_redLayer == nil) {
        _redLayer = [CALayer layer];
        _redLayer.frame = CGRectMake(10, 100, 100, 100);
        _redLayer.backgroundColor = [UIColor redColor].CGColor;
        [self.view.layer addSublayer:_redLayer];
    }
    return _redLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)startAnimation:(id)sender {
    [self.redLayer removeAllAnimations];
    //CAPropertyAnimation:属性动画的抽象类,用于定义某个属性的动画,可以使用其具体类CABasicAnimation和CAKeyFrameAnimation来执行动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    //定义属性动画的keyPath,对其中的某一个属性来执行动画
    basicAnimation.keyPath = @"position.x";
    //
    basicAnimation.additive = YES;
    basicAnimation.fromValue = @100;
    basicAnimation.toValue = @200;
    [self.redLayer addAnimation:basicAnimation forKey:nil];
}
@end
