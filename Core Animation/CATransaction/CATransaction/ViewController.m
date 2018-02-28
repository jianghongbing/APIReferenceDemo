//
//  ViewController.m
//  CATransaction
//
//  Created by pantosoft on 2018/2/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIView *redView;
//@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *orangeLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@property (nonatomic, strong) CALayer *grayLayer;
@property (nonatomic, strong) CALayer *purpleLayer;
@property (nonatomic) BOOL didExcuteImplicitTransaction;
@property (nonatomic) BOOL didExcuteImplicitTransactionWithoutAnimation;
@property (nonatomic) BOOL didExcuteExplicitTransaction;
@property (nonatomic) BOOL didExcuteExplicitTransactionWithoutAnimation;
@property (nonatomic) BOOL didExcuteNestedTansaction;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CATransaction:事务,当修改layer的一些属性,到渲染的过程,都可以看做是一个事务
    //1.隐式事务
    //直接通过修改layer的属性,直接提交到渲染树,系统会自动创建一个隐私事务,并在下次运行循环的时候,就提交该事务
    //当直接修改layer的属性,CoreAnimation默认产生一个隐式动画,时长为默认的0.25s,有时候在实际的需求中不需要该动画,可以通过[CATransaction setDisableActions:YES];来取消隐式动画
    //2.显示事务
    //通过begin和commit的显示方式来开始事务和提交事务
    self.redLayer = [self createWithBackgroundColor:[UIColor redColor] frame:CGRectMake(20, 40, 100, 100)];
    self.orangeLayer = [self createWithBackgroundColor:[UIColor orangeColor] frame:CGRectMake(CGRectGetWidth(self.view.frame) - 20 - 100, 40, 100, 100)];
    self.blueLayer = [self createWithBackgroundColor:[UIColor blueColor] frame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50, 40, 100, 100)];
    self.greenLayer = [self createWithBackgroundColor:[UIColor greenColor] frame:CGRectMake(20, 150, 100, 100)];
    self.grayLayer = [self createWithBackgroundColor:[UIColor grayColor] frame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50, 150, 100, 100)];
    self.purpleLayer = [self createWithBackgroundColor:[UIColor purpleColor] frame:CGRectMake(CGRectGetWidth(self.view.frame) - 20 - 100, 150, 100, 100)];
}

- (CALayer *)createWithBackgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = backgroundColor.CGColor;
    layer.frame = frame;
    [self.view.layer addSublayer:layer];
    return layer;
}



- (IBAction)startImplicitTransactionWithAnimation:(id)sender {
    if (self.didExcuteImplicitTransaction) {
        self.redLayer.cornerRadius = 0;
        self.redLayer.backgroundColor = [UIColor redColor].CGColor;
        CGRect frame = self.redLayer.frame;
        frame.origin.y -= 200;
        self.redLayer.frame = frame;
        self.didExcuteImplicitTransaction = NO;
    }else {
        self.redLayer.cornerRadius = 50;
        self.redLayer.backgroundColor = [UIColor orangeColor].CGColor;
        CGRect frame = self.redLayer.frame;
        frame.origin.y += 200;
        self.redLayer.frame = frame;
        self.didExcuteImplicitTransaction = YES;
    }

}

- (IBAction)startImplicitTransactionWithoutAnimatin:(id)sender {
    if (self.didExcuteImplicitTransactionWithoutAnimation) {
        [CATransaction setDisableActions:YES];
        self.orangeLayer.cornerRadius = 0;
        self.orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
        CGRect frame = self.orangeLayer.frame;
        frame.origin.y -= 200;
        self.orangeLayer.frame = frame;
        self.didExcuteImplicitTransactionWithoutAnimation = NO;
    }else {
        [CATransaction setDisableActions:YES];
        self.orangeLayer.cornerRadius = 50;
        self.orangeLayer.backgroundColor = [UIColor redColor].CGColor;
        CGRect frame = self.orangeLayer.frame;
        frame.origin.y += 200;
        self.orangeLayer.frame = frame;
        self.didExcuteImplicitTransactionWithoutAnimation = YES;
    }
}


- (IBAction)startExplicitTransaction:(id)sender {
    if (self.didExcuteExplicitTransaction) {
        [CATransaction begin];
        //1.设置显式动画的时长
        [CATransaction setAnimationDuration:2.0];
        //2.是否禁用动画
        [CATransaction setDisableActions:NO];
        //3.设置动画的缓冲类型
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        //4.事务结束后的回调
        [CATransaction setCompletionBlock:^{
            NSLog(@"completion transaction");
        }];
        self.blueLayer.cornerRadius = 0;
        self.self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
        CGRect frame = self.blueLayer.frame;
        frame.origin.y -= 200;
        self.blueLayer.frame = frame;
        [CATransaction commit];
        self.didExcuteExplicitTransaction = NO;
    }else {
        [CATransaction begin];
        //5.通过setValue:forKey的方式来设置事务的设置,同上面的设置效果一致
        [CATransaction setValue:@2.0 forKey:kCATransactionAnimationDuration];
        [CATransaction setValue:@(NO) forKey:kCATransactionDisableActions];
        [CATransaction setValue:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] forKey:kCATransactionAnimationTimingFunction];
        [CATransaction setValue:^{
            NSLog(@"completion transaction");
        } forKey:kCATransactionCompletionBlock];
        self.blueLayer.cornerRadius = 50;
        self.self.blueLayer.backgroundColor = [UIColor greenColor].CGColor;
        CGRect frame = self.blueLayer.frame;
        frame.origin.y += 200;
        self.blueLayer.frame = frame;
        [CATransaction commit];
        self.didExcuteExplicitTransaction = YES;
    }
}
- (IBAction)excuteExplicitTransitionWithoutAnimation:(id)sender {
    if (self.didExcuteExplicitTransactionWithoutAnimation) {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        [CATransaction setDisableActions:YES];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^{
            NSLog(@"completion transaction");
        }];
        self.greenLayer.cornerRadius = 0;
        self.greenLayer.backgroundColor = [UIColor greenColor].CGColor;
        CGRect frame = self.greenLayer.frame;
        frame.origin.y -= 200;
        self.greenLayer.frame = frame;
        [CATransaction commit];
        self.didExcuteExplicitTransactionWithoutAnimation = NO;
    }else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        [CATransaction setDisableActions:YES];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^{
            NSLog(@"completion transaction");
        }];
        self.greenLayer.cornerRadius = 50;
        self.greenLayer.backgroundColor = [UIColor blueColor].CGColor;
        CGRect frame = self.greenLayer.frame;
        frame.origin.y += 200;
        self.greenLayer.frame = frame;
        [CATransaction commit];
        self.didExcuteExplicitTransactionWithoutAnimation = YES;
    }
}


- (IBAction)excuteNestedTransaction:(id)sender {
    //事务内嵌:事务中再嵌套事务,嵌套的事务的代码都是同时执行的,但是外部事务要等到内部事务完成后完成
    if (self.didExcuteNestedTansaction) {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        [CATransaction setCompletionBlock:^{
            NSLog(@"outer transaction excute complete");
        }];
        self.purpleLayer.cornerRadius = 0;
        self.purpleLayer.backgroundColor = [UIColor purpleColor].CGColor;
        CGRect purpleLayerFrame = self.purpleLayer.frame;
        purpleLayerFrame.origin.y -= 200;
        self.purpleLayer.frame = purpleLayerFrame;
        [CATransaction begin];
        [CATransaction setAnimationDuration:3.0];
        [CATransaction setCompletionBlock:^{
            NSLog(@"inner transaction excute complete");
        }];
        self.grayLayer.cornerRadius = 0;
        self.grayLayer.backgroundColor = [UIColor grayColor].CGColor;
        CGRect grayLayerFrame = self.grayLayer.frame;
        grayLayerFrame.origin.y -= 200;
        self.grayLayer.frame = grayLayerFrame;
        [CATransaction commit];
        [CATransaction commit];
        self.didExcuteNestedTansaction = NO;
    }else {
        [CATransaction lock];
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        [CATransaction setCompletionBlock:^{
            NSLog(@"outer transaction excute complete");
        }];
        self.grayLayer.cornerRadius = 50.0;
        self.grayLayer.backgroundColor = [UIColor blackColor].CGColor;
        CGRect grayLayerFrame = self.grayLayer.frame;
        grayLayerFrame.origin.y += 200;
        self.grayLayer.frame = grayLayerFrame;
        [CATransaction begin];
        [CATransaction setAnimationDuration:3.0];
        [CATransaction setCompletionBlock:^{
            NSLog(@"inner transaction excute complete");
        }];
        self.purpleLayer.cornerRadius = 50.0;
        self.purpleLayer.backgroundColor = [UIColor yellowColor].CGColor;
        CGRect purpleLayerFrame = self.purpleLayer.frame;
        purpleLayerFrame.origin.y += 200;
        self.purpleLayer.frame = purpleLayerFrame;
        [CATransaction commit];
        [CATransaction commit];
        [CATransaction unlock];
        self.didExcuteNestedTansaction = YES;
    }

}
@end
