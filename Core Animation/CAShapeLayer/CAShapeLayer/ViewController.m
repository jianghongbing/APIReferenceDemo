//
//  ViewController.m
//  CAShapeLayer
//
//  Created by pantosoft on 2018/2/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CAShapeLayer:可以绘制任何形状的layer,其中path的坐标原点以layer的左上角(iOS中)作为原点,绘制形状会覆盖在layer原有的内容上面
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 100, 100, 100)];
    shapeLayer.path = bezierPath.CGPath; //设置shapeLayer的绘制路径
    shapeLayer.lineWidth = 5.0; //设置绘制形状线条的宽度
    shapeLayer.strokeColor = [UIColor redColor].CGColor; //shape线条的颜色
    [self.view.layer addSublayer:shapeLayer];

    CAShapeLayer *trangleLayer = [CAShapeLayer layer];
    trangleLayer.frame = CGRectMake(150, 100, 100, 100);
    trangleLayer.backgroundColor = [UIColor orangeColor].CGColor;
    trangleLayer.strokeColor = [UIColor blueColor].CGColor;
    trangleLayer.fillColor = [UIColor redColor].CGColor; //path的填充颜色
    trangleLayer.lineWidth = 5.0;
    trangleLayer.strokeStart = 0.1; //开始stroke的地方,以比率为单位
    trangleLayer.strokeEnd = 0.7; //结束stroke的方法,以比率为单位
    UIBezierPath *tranglePath = [UIBezierPath bezierPath];
    [tranglePath moveToPoint:CGPointMake(50, 20)];
    [tranglePath addLineToPoint:CGPointMake(20, 80)];
    [tranglePath addLineToPoint:CGPointMake(80, 80)];
    [tranglePath closePath];
    trangleLayer.path = tranglePath.CGPath;
    [self.view.layer addSublayer:trangleLayer];
    
    NSArray *lineCapArray = @[kCALineCapButt, kCALineCapRound, kCALineCapSquare];
    NSArray *lineJoinArray = @[kCALineJoinBevel, kCALineJoinMiter, kCALineJoinRound];
    CGFloat layerWidth = [UIScreen mainScreen].bounds.size.width / lineJoinArray.count;
    CGFloat layerHeight = 150;
    CGFloat layerY = 300;
    [lineCapArray enumerateObjectsUsingBlock:^(NSString *lineCap, NSUInteger idx, BOOL *stop) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineCap = lineCap; //绘制线条的开始和结束且该出没有和其他线条相交时的样式
        layer.lineJoin = lineJoinArray[idx]; //绘制线条连接处的样式
        layer.miterLimit = 3.0; //只有当lineJoin为lineJoineMiter时,该属性才会起作用,这个属性决定是否两条线连接处的样式,斜接处的长度有line width决定,如果斜接处的长度大于miterLimit的值,此时连接处的样式绘制成kCALineJoinBevel
        CGFloat layerX = layerWidth * idx;
        layer.frame = CGRectMake(layerX, layerY, layerWidth, layerHeight);
        layer.backgroundColor = [UIColor orangeColor].CGColor;
        layer.lineWidth = 8.0;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor blueColor].CGColor;
        UIBezierPath *layerPath = [UIBezierPath bezierPath];
        [layerPath moveToPoint:CGPointMake(20, 20)];
        [layerPath addLineToPoint:CGPointMake(layerWidth - 40, 20)];
        [layerPath moveToPoint:CGPointMake(layerWidth * 0.5, 50)];
        [layerPath addLineToPoint:CGPointMake(20, layerHeight - 20)];
        [layerPath addLineToPoint:CGPointMake(layerWidth - 40, layerHeight - 20)];
        layer.path = layerPath.CGPath;
        [self.view.layer addSublayer:layer];
    }];
    
    CAShapeLayer *dashLayer = [CAShapeLayer layer];
    dashLayer.frame = CGRectMake(20, 470, 100, 100);
    dashLayer.backgroundColor = [UIColor whiteColor].CGColor;
    dashLayer.fillColor = [UIColor clearColor].CGColor;
    dashLayer.lineWidth = 2.0;
    dashLayer.strokeColor = [UIColor grayColor].CGColor;
    dashLayer.lineDashPhase = 10.0; //相位,lineDashPattern开始的位置
    dashLayer.lineDashPattern = @[@5, @10, @15]; //画虚线的规则,依次画实现和虚线,长度和数组中的长度一一对应
    CGPoint points[] = {
        CGPointMake(0, 0),
        CGPointMake(100, 0),
        CGPointMake(100, 100),
        CGPointMake(0, 100)
    };
    CGMutablePathRef dashPath = CGPathCreateMutable();
    CGPathAddLines(dashPath, nil, points, sizeof(points) / sizeof(CGPoint));
    CGPathCloseSubpath(dashPath);
    dashLayer.path = dashPath;
    [self.view.layer addSublayer:dashLayer];
    CGPathRelease(dashPath);
}

@end
