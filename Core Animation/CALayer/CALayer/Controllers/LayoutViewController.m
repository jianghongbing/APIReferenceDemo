//
//  LayoutViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LayoutViewController.h"
#import "LayoutTestLayer.h"
@interface LayoutViewController ()
@property (nonatomic, strong) LayoutTestLayer *layer;
@end

@implementation LayoutViewController
#pragma mark getter
- (LayoutTestLayer *)layer {
    if (_layer == nil) {
        _layer = [LayoutTestLayer layer];
        _layer.frame = CGRectMake(100, 100, 200, 200);
//        _layer.position = CGPointMake(250, 250);
    }
    return _layer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer addSublayer:self.layer];
    
    //CALayer布局
    //1.layoutSubLayers:和UIView的layoutSubViews类似,在父类layer的frame的size发生改变时,父layer会收到该消息.或者通过强制重新布局方法setNeedLayout来,布局subLayers,改变layer的transform不会发送layoutSubLayers消息给layer.一般通过该方法来精确布局subLayer,此时layer的位置和大小已经确定.不要直接调用该方法,通过setNeedLayout或者layoutIfNeed方式.
    //2.setNeedLayout:强制重新布局subLayers,发送layoutSubLayers消息给layer
    //3.layoutIfNeed:在需要布局subLayers的时候,发送layoutSubLayers消息给layer
    //4.needLayout:获取layer是否需要重新布局subLayers
    //5.preferredFrameSize:在superLayer中的偏好大小,貌似在iOS系统中没有什么用
    
}
- (IBAction)changeFrame:(id)sender {
    if (CGRectEqualToRect(CGRectMake(100, 100, 200, 200), self.layer.frame)) {
        self.layer.frame = CGRectMake(50, 100, 200, 200);
    }else {
        self.layer.frame = CGRectMake(100, 100, 200, 200);
    }
}
- (IBAction)changeBounds:(id)sender {
    if (CGRectEqualToRect(CGRectMake(0, 0, 200, 200), self.layer.bounds)) {
        self.layer.bounds = CGRectMake(0, 0, 250, 250);
    }else {
        self.layer.bounds = CGRectMake(0, 0, 200, 200);
    }
    [self.layer layoutIfNeeded];
//    BOOL needLayout = [self.layer needsLayout];
//    if (needLayout) {
//        NSLog(@"need layout");
//        [self.layer setNeedsLayout];
//    }else {
//        NSLog(@"not need layout");
//    }
}
- (IBAction)changePosition:(id)sender {
    if (CGPointEqualToPoint(CGPointMake(250, 250), self.layer.position)) {
        self.layer.position = CGPointMake(300, 300);
    }else {
        self.layer.position = CGPointMake(250, 250);
    }
}
- (IBAction)changeTransform:(id)sender {
    if (CGAffineTransformEqualToTransform(CGAffineTransformIdentity, self.layer.affineTransform)) {
//        self.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4); //旋转不会重新布局subLayer
        self.layer.affineTransform = CGAffineTransformMakeScale(1.2, 0.8);
    }else {
        self.layer.affineTransform = CGAffineTransformIdentity;
    }
}
- (IBAction)forceLayout:(id)sender {
    [self.layer setNeedsLayout];
}
@end
