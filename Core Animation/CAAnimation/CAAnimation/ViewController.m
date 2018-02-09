//
//  ViewController.m
//  CAAnimation
//
//  Created by pantosoft on 2018/2/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CAAnimation:动画的抽象类,用于描述某个动画,layer通过添加CAAnimation来实现动画

    
    
}
#pragma mark CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}


- (IBAction)startAnimation:(id)sender {
//    CAAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    //1.设置动画的代理
//    animation.delegate = self;
//    //2.CAMediaTiming:用于管理动画的时间
//    //
//    animation.beginTime = 2.0;
//    animation.duration = 2.0;
//    animation.speed = 1.5;
    
}
- (IBAction)removeAnimation:(id)sender {
}
@end
