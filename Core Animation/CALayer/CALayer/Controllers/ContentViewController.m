//
//  ContentViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ContentViewController.h"
@interface ContentViewController() <CALayerDelegate>
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *orangeLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@end
@implementation ContentViewController
#pragma mark
- (CALayer *)redLayer {
    if (_redLayer == nil) {
        _redLayer = [CALayer layer];
        _redLayer.frame = CGRectMake(50, 100, 100, 100);
        _redLayer.backgroundColor = [UIColor redColor].CGColor;
    }
    return _redLayer;
}

- (CALayer *)orangeLayer {
    if (_orangeLayer == nil) {
        _orangeLayer = [CALayer layer];
        _orangeLayer.backgroundColor = [UIColor orangeColor].CGColor;
        _orangeLayer.frame = CGRectMake(50, 200, 100, 100);
        _orangeLayer.delegate = self;
//        _orangeLayer.opaque = YES;
//        _orangeLayer.allowsGroupOpacity = NO;
    }
    return _orangeLayer;
}
//
- (CALayer *)blueLayer {
    if (_blueLayer == nil) {
        _blueLayer = [CALayer layer];
        _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
        _blueLayer.frame = CGRectMake(200, 200, 100, 100);
        _blueLayer.delegate = self;
//        _blueLayer.opaque = YES;
    }
    return _blueLayer;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //CALayer上的content:即layer上显示的内容
    //1.直接通过content赋值,只支持简单的静态图片
    [self.view.layer addSublayer:self.redLayer];
    self.redLayer.contents = (id)([UIImage imageNamed:@"cat40x40"].CGImage); //直接赋值CGImage给contents
//    self.redLayer.contentsRect = CGRectMake(0.2, 0.2, 0.8, 0.8); //只使用content内容的其中一部分,将对应比例rect的内容显示在layer上
    self.redLayer.contentsScale = [UIScreen mainScreen].scale; //内容的显示比率,一般将其设置为屏幕的显示比率,如在retina屏幕中为2.0
    //contentGravity:内容的布局模式,和UIViewContentMode类似
    //kCAGravityCenter:将内容显示在layer的中间,不调整内容的大小
    //kCAGravityTop:将内容显示在layer的上面
    //kCAGravityBottom:将内容显示在layer的下面
    //kCAGravityLeft:将内容显示在layer的左边
    //kCAGravityRight:将内容显示在layer的右边
    //kCAGravityTopLeft:将内容显示在layer的左上角
    //kCAGravityTopRight:将内容显示在layer的右上角
    //kCAGravityBottomLeft:将内容显示在layer的左下角
    //kCAGravityBottomRight:将内容显示在layer的右下角
    //kCAGravityResize:将内容填充整个layer
    //kCAGravityResizeAspect:将内容某一个方向填充,另一个方向根据图片的高宽比率适配,在该放上下可能不填充
    //kCAGravityResizeAspectFill:将内容某一个方向填充,另一个方向根据图片的高宽比率适配,在该方向上填充,可能该方向的内容起始位置不是图片的起始位置
    self.redLayer.contentsGravity = kCAGravityResize;
    //contentsCenter:需要配合contentsGravity使用,而且contentsGravity的值必须为resize中的一种,当layer的frame的size超过contents的大小的时候,指定范围内的部分内容不进行拉伸,范围之外的内容进行拉伸,
    self.redLayer.contentsCenter = CGRectMake(0, 0.5, 0.5, 0.5);
    if (@available(iOS 10.0, *)) {
        //内容格式
        self.redLayer.contentsFormat = kCAContentsFormatRGBA8Uint;
    } else {
    }
    
//    [self.view.layer addSublayer:self.blueLayer];
    //当图片显示在比图片小的layer上的时候,图片会被压缩,minificationFilter就是在图片压缩后的模糊效果
//    self.redLayer.minificationFilter = kCAFilterNearest;
    //当图片显示在比图片大的layer上的时候,图片可能被会拉伸,magnificationFilter就是在图片放大后的模糊效果
//    self.redLayer.magnificationFilter = kCAFilterTrilinear;
    //2.可以通过delegate来传递内容给layer
    [self.view.layer addSublayer:self.orangeLayer];
    [self.orangeLayer setNeedsDisplay];
    [self.view.layer addSublayer:self.blueLayer];
    [self.blueLayer setNeedsDisplay];
    //2.1 通过代理设置contents:在代理方法displayLayer:中直接提供layer的内容
    //2.2 通过代理绘制layer的contents:在代理方法中displayLayer:inContext:中绘制layer的内容,当实现了displayLayer:该方法不会被调用,会直接通过displayLayer来提供layer的内容
    //3.通过subLayer重写drawInContext:来绘制layer上的内容
}

#pragma makr CALayerDelegate

//在代理中设置layer的contents
//- (void)displayLayer:(CALayer *)layer {
//    if (layer == self.orangeLayer) {
//        layer.contents = (id)[UIImage imageNamed:@"dog"].CGImage;
//    }else if (layer == self.blueLayer) {
//        layer.contents = (id)[UIImage imageNamed:@"cat40x40"].CGImage;
//    }
//}

//在代理中绘制layer的contents
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    if (layer == self.orangeLayer) {
        CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
        CGContextSetLineWidth(ctx, 5.0);
        CGContextAddEllipseInRect(ctx, layer.bounds);
        CGContextStrokePath(ctx);
    }else if (layer == self.blueLayer) {
        CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
        CGContextSetLineWidth(ctx, 3.0);
        CGContextAddArc(ctx, layer.bounds.size.width * 0.5, layer.bounds.size.height * 0.5, 30, 0, M_2_PI, YES);
        CGContextFillPath(ctx);
    }
}
- (void)dealloc {
    self.orangeLayer.delegate = nil;
    self.blueLayer.delegate = nil;
}
@end
