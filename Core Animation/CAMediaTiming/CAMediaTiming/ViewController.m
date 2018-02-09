//
//  ViewController.m
//  CAMediaTiming
//
//  Created by pantosoft on 2018/2/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CAMediaTiming协议:CAAnimation通过实现该协议,达到对动画的时间的控制
    //beginTime:定义动画开始的时间,默认为0,通常设置为CACurrentMediaTime()+某个值,表示在延迟多少秒后执行动画
    //duration:执行一次动画持续的时间, 默认的值是0,但是如果不设置或者设置为0,执行一次动画的时间为0.25秒
    //repeatCount:执行动画的次数,默认的值是0,如果不设置或者设置为0,执行一次动画,当设置为一个无限大的数,动画可以无限循环执行
    //speed:执行动画的速度,默认为1,大于1动画执行的速度会加快,如同快进,如果值大于0小于1,动画执行的速度会减慢,如果小于0会倒退动画
    //repeatDuration:动画重复执行的时间,执行的次数等于repeatDuration除以duration的值,如果设置为无限大的数,动画可以无限循环执行.当同时设置repeatCount和repeatDuration的值时,可能会产生冲突
    //timeOffset:从那个位置的时间开始执行动画,layer会立即到指定的时间的位置,然后在执行其他部分的动画,然后回来在执行之前跳过部分的动画
    //autoreverses:动画反转,在动画执行完后,在回到之前的状态之间,执行动画的反转
    //fillMode:动画结束后,layer保持的状态.当动画的removedOnCompletion为NO时,layer在完成动画后会回到之前的状态,当动画的removedOnCompletion为YES时,fillMode的设置才会生效
    //kCAFillModeForwards:动画结束后,layer呈现动画所保存的状态
    //kCAFillModeRemoved:动画结束后,移除掉动画呈现的状态,回到动画前的layer自身的状态,默认值就是该选项
    //kCAFillModeBackwards:在动画开始前,layer会立即呈现动画执行前的状态,结束后,layer会回到layer自身的状态,不会呈现动画保存的状态
    //kCAFillModeBoth:kCAFillModeForwards和kCAFillModeBackwards,在动画执行前和结束后,layer一直呈现动画保存的状态
    UIView *redView = [self createViewWithFrame:CGRectMake(20, 40, 100, 100) backgroundColor:[UIColor redColor]];
    CABasicAnimation *backgroundColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backgroundColorAnimation.toValue = (__bridge id)[UIColor blueColor].CGColor;
    //动画总持续时间为1.0 * 10.5
    backgroundColorAnimation.duration = 1.0;
    backgroundColorAnimation.repeatCount = 10.5;
    [redView.layer addAnimation:backgroundColorAnimation forKey:@"backgroundAnimation"];
    
    UIView *orangeView = [self createViewWithFrame:CGRectMake(150, 40, 100, 100) backgroundColor:[UIColor orangeColor]];
    CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    translateAnimation.byValue = @200;
    translateAnimation.duration = 1.0;
    translateAnimation.repeatDuration = 5;
    [orangeView.layer addAnimation:translateAnimation forKey:@"translateAnimation"];
    
    self.blueView = [self createViewWithFrame:CGRectMake(20, 150, 100, 100) backgroundColor:[UIColor blueColor]];
    self.orangeView = [self createViewWithFrame:CGRectMake(150, 150, 100, 100) backgroundColor:[UIColor orangeColor]];
}

- (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    [self.view addSubview:view];
    return view;
}
- (IBAction)excuteBeginTimeAnimation:(id)sender {
    [self.blueView.layer removeAllAnimations];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.byValue = @200;
    basicAnimation.duration = 2.0;
    basicAnimation.beginTime = 3 + CACurrentMediaTime();
    [self.blueView.layer addAnimation:basicAnimation forKey:nil];
}


- (IBAction)excuteTimeOffsetAnimation:(id)sender {
    [self.blueView.layer removeAllAnimations];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.byValue = @200;
    basicAnimation.duration = 5.0;
    basicAnimation.timeOffset = 2.0;
    [self.blueView.layer addAnimation:basicAnimation forKey:nil];
}

- (IBAction)excuteSpeedAnimation:(id)sender {
    [self.blueView.layer removeAllAnimations];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.byValue = @200;
    basicAnimation.duration = 2.0;
    basicAnimation.speed = 4.0;
    [self.blueView.layer addAnimation:basicAnimation forKey:nil];
}

- (IBAction)excuteAutoreversesAnimation:(id)sender {
    [self.blueView.layer removeAllAnimations];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.byValue = @200;
    basicAnimation.duration = 2.0;
    basicAnimation.autoreverses = YES;
    [self.blueView.layer addAnimation:basicAnimation forKey:nil];
}
- (IBAction)excuteFillModeAnimation:(id)sender {
    [self.blueView.layer removeAllAnimations];
    [self.orangeView.layer removeAllAnimations];
    CABasicAnimation *basicAnimationOne = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimationOne.fromValue = @250;
    basicAnimationOne.byValue = @200;
    basicAnimationOne.duration = 2.0;
    basicAnimationOne.fillMode = kCAFillModeForwards;
    basicAnimationOne.beginTime = 3 + CACurrentMediaTime();
    basicAnimationOne.removedOnCompletion = NO;
    [self.blueView.layer addAnimation:basicAnimationOne forKey:nil];
    
    CABasicAnimation *basicAnimationTwo = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimationTwo.fromValue = @250;
    basicAnimationTwo.byValue = @200;
    basicAnimationTwo.duration = 2.0;
    basicAnimationTwo.fillMode = kCAFillModeBackwards;
    basicAnimationTwo.beginTime = 3 + CACurrentMediaTime();
    basicAnimationTwo.removedOnCompletion = NO;
    [self.orangeView.layer addAnimation:basicAnimationTwo forKey:nil];
}

@end
