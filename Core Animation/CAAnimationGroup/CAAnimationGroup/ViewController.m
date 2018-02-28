//
//  ViewController.m
//  CAAnimationGroup
//
//  Created by pantosoft on 2018/2/28.
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
    redLayer.frame = CGRectMake(100, 100, 100, 100);
    [self.view.layer addSublayer:redLayer];
    
    CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    translateAnimation.duration = 1.0;
    translateAnimation.fromValue = @(redLayer.position.x);
    translateAnimation.byValue = @200;
//    translateAnimation.repeatCount = HUGE;
    
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.duration = 1.0;
    rotateAnimation.fromValue = @0;
    rotateAnimation.toValue = @(M_PI * 2);
//    rotateAnimation.repeatCount = 2;
//    rotateAnimation.additive = YES;
    
//    [redLayer addAnimation:translateAnimation forKey:nil];
//    [redLayer addAnimation:rotateAnimation forKey:nil];
    
    
    //CAAnimationGroup:动画组,将多个动画组成一个动画来执行.尽管可以通过添加多个动画在layer上来执行,但是使用CAAnimationGroup更为方便
    //group和group内动画时间和次数
    //动画组执行的次数有动画组设置的次数决定,在一个动画组执行的过程中,动画组里面的动画执行的次数由内部动画自己执行的次数决定
    
    //group的动画时间不会去拉伸其内部动画设置的时间,如加入group设置的时间为10,其内部设置的动画时间为5,内部动画的时间还是为5,不过在一个组动画执行的过程中,其内部动画执行的次数为group的时间除以内部动画的时间
    //如果group设置的时间小于内部动画设置的时间,内部动画只执行开始到group设置的时间之间的动画
    //所以一般最好将组动画的时间和里面的子动画的时间保持一致,次数交给group来控制
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[translateAnimation, rotateAnimation];
    group.duration = 1.0;
    group.repeatCount = 2;
    group.repeatCount = HUGE;
    [redLayer addAnimation:group forKey:nil];

}
@end
