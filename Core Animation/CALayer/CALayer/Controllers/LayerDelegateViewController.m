//
//  LayerDelegateViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LayerDelegateViewController.h"
#import "TestView.h"
@interface LayerDelegateViewController ()<CALayerDelegate>
//@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, strong) TestView *redView;
@property (nonatomic, strong) CALayer *blueLayer;
@end

@implementation LayerDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //View和Layer的关系
    //在创建View的时候,自动会创建一个layer对象给View,View中的内容都是layer呈现出来的,作为view的backup,默认view中的layer的delegate就是view,而view通过drawInRect绘制的内容也都绘制到layer上面去了,View默认就遵守了CALayerDelegate,不要将view的layer的delegate赋值给view之外的其他对象
    //Layer不能响应事件,需要View本身去处理,将Layer和View分开,只关心自己需要实现的功能
    self.redView = [[TestView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview: self.redView];
    
    self.orangeView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeView];
    
}

#pragma mark CALayerDelegate


@end
