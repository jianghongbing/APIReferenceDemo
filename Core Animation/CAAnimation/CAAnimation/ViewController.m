//
//  ViewController.m
//  CAAnimation
//
//  Created by pantosoft on 2018/2/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
static NSString * const kAnimationKeyPath = @"redViewLayerAnimation";
@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CAAnimation:动画的抽象类,用于描述某个动画,layer通过添加CAAnimation来实现动画
}
#pragma mark CAAnimationDelegate
//动画开始的时候的回调
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"func:%s", __func__);
}
//动画结束的回调,flag:YES:表示动画完成, NO:表示动画取消
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"func:%s, flag:%d", __func__, flag);
}


- (IBAction)startAnimation:(id)sender {
//    [self.redView.layer removeAllAnimations];
    [self.redView.layer removeAnimationForKey:kAnimationKeyPath];
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"position.y";
    basicAnimation.fromValue = @(self.redView.layer.position.y);
    basicAnimation.byValue = @200;
    basicAnimation.duration = 2.0;
    basicAnimation.repeatCount = 5.0;
    basicAnimation.delegate = self;
    [self.redView.layer addAnimation:basicAnimation forKey:kAnimationKeyPath];
}
- (IBAction)removeAnimation:(id)sender {
    [self.redView.layer removeAnimationForKey:kAnimationKeyPath];
}
@end
