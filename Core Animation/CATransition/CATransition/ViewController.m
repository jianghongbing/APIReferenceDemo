//
//  ViewController.m
//  CATransition
//
//  Created by pantosoft on 2018/2/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) CALayer *orangeLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //CATransition:layer的过渡转场动画
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectMake(100, 100, 100, 100);
    [self.view.layer addSublayer:redLayer];
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(10, 10, 50, 50);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [redLayer addSublayer:blueLayer];
    self.redLayer = redLayer;
    self.blueLayer = blueLayer;
    CALayer *orangeLayer = [CALayer layer];
    orangeLayer.frame = CGRectMake(10, 10, 50, 50);
    orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.orangeLayer = orangeLayer;
}
- (IBAction)startAnimation:(id)sender {
    if (self.blueLayer.superlayer == self.redLayer) {
        [self.redLayer replaceSublayer:self.blueLayer with:self.orangeLayer];
    }else if (self.orangeLayer.superlayer == self.redLayer) {
        [self.redLayer replaceSublayer:self.orangeLayer with:self.blueLayer];
    }
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    //1.过渡方式,默认为kCATransitionFade
    transition.type = kCATransitionPush;
    //2.过渡方式的子类型:
    transition.subtype = kCATransitionFromTop;
    [self.redLayer addAnimation:transition forKey:nil];
}
@end
