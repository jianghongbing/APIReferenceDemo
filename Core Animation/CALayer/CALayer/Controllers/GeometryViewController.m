//
//  GeometryViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "GeometryViewController.h"

CGRect originFrame(void) {
    return CGRectMake(100, 100, 80, 80);
}

CGRect changedFrame(void) {
    return CGRectMake(120, 130, 150, 150);
}


CGRect originBounds(void) {
    return CGRectMake(0, 0, CGRectGetWidth(originFrame()), CGRectGetHeight(originFrame()));
}

CGRect changedBounds(void) {
    return CGRectMake(0, 0, CGRectGetWidth(changedFrame()), CGRectGetHeight(changedFrame()));
}

@interface GeometryViewController ()
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CALayer *transform3DLayer;
@end

@implementation GeometryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CALayer:视图图层,用于展示内容和执行动画,不能进行交互
    //Layer的位置等相关属性
    //1.frame:定义view的位置和大小,此属性不支持动画,frame是通过bounds, position和anchorPoint计算出来的
    //1.1 frame的各个值的计算
    // frame.origin.x = position.x - bounds.size.width * anchorPoint.x;
    // frame.origin.y = position.y - bounds.size.height * anchorPoint.y;
    // frame.size.width = bounds.size.width;
    // frame.size.height = bounds.size.height;
    //2.bounds:定义layer的大小,以layer左上角(iOS中,mac为左下角)为原点(0,0),和size组成的区域
    //3.position:定义layer的位置,默认为layer的中心点
    //4.anchorPoint:锚点,当视图发生旋转时,会以该点为轴进行旋转.锚点的值以比率为单位,在0到1之间,默认为(0.5, 0.5),即layer的中心点
    //5.content scale:layer上的内容显示的缩放比率,默认为1.0.如果在2x或者3x屏幕上使用1.0,layer上的内容会有拉伸的现象,一般将其设置为屏幕的显示比率
    //6.zPosition: 等同于在z轴上做偏移,zPosition的值越大,就显示在z轴的前面
    //7.anchorPointZ:
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = originFrame();
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:redLayer];
    self.layer = redLayer;
    //8.affineTransform:2D形变,平面形变,2D形变是tranform3D的一部分,修改2d形变的值,会改变transform3D的值
    //8.transform:3D形变,修改3d形变的值,可能会修改2d形变的值
    //9 subLayerTransform:修改和获取子图层的tranform, 默认值为identity transform
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(80, 80, 60, 60);
    [self.view.layer addSublayer:blueLayer];
    
    redLayer.zPosition = 10;
    
}
- (IBAction)logLayerInfo:(id)sender {
    if (self.layer == nil) return;
    CGRect frame = self.layer.frame;
    CGRect bounds = self.layer.bounds;
    CGPoint position = self.layer.position;
    CGPoint anchorPoint = self.layer.anchorPoint;
    CGFloat zPosition = self.layer.zPosition;
    CGFloat anchorPointZ = self.layer.anchorPointZ;
    CGFloat contentScale = self.layer.contentsScale;
    NSLog(@"frame:%@\nbounds:%@\nposition:%@\nanchorPoint:%@\nzPosition:%f\nanchorPointZ:%f\ncontentScale:%f\n", NSStringFromCGRect(frame), NSStringFromCGRect(bounds), NSStringFromCGPoint(position), NSStringFromCGPoint(anchorPoint), zPosition, anchorPointZ, contentScale);
    CGAffineTransform transform2D = self.layer.affineTransform;
    CATransform3D transform3D = self.layer.transform;
    NSLog(@"transform2D:%@\n", NSStringFromCGAffineTransform(transform2D));
    NSLog(@"transform3D:[\n%.2f,%.2f,%.2f,%.2f\n%.2f,%.2f,%.2f,%.2f\n%.2f,%.2f,%.2f,%.2f\n%.2f,%.2f,%.2f,%.2f\n]\n", transform3D.m11, transform3D.m12, transform3D.m13, transform3D.m14, transform3D.m21, transform3D.m22, transform3D.m23, transform3D.m24, transform3D.m31, transform3D.m32, transform3D.m33, transform3D.m34, transform3D.m41, transform3D.m42, transform3D.m43, transform3D.m44);
    
    
    
}
- (IBAction)changeFrame:(id)sender {
    //1.改变frame,可能会改变position和bounds的值,不会改变anchorPoint的值
    if (CGRectEqualToRect(originFrame(), self.layer.frame)) {
        self.layer.frame = changedFrame();
    }else {
        self.layer.frame = originFrame();
    }
    [self logLayerInfo:nil];
}


- (IBAction)changeBounds:(id)sender {
    //2.改变bounds,会改变frame和position
    if (CGRectEqualToRect(originBounds(), self.layer.bounds)) {
        self.layer.bounds = changedBounds();
    }else {
        self.layer.bounds = originBounds();
    }
    [self logLayerInfo:nil];
}

- (IBAction)changePosition:(id)sender {
    //改变position会改变frame
    if (CGPointEqualToPoint(CGPointMake(150, 150), self.layer.position)) {
        self.layer.position = CGPointMake(200, 200);
    }else {
        self.layer.position = CGPointMake(150, 150);
    }
    [self logLayerInfo:nil];
}
- (IBAction)changeAnchorPoint:(id)sender {
    //修改anchorPoint的值会改变frame的origin的值,不会改变position和bounds的值
    if (CGPointEqualToPoint(CGPointMake(0.5, 0.5), self.layer.anchorPoint)) {
        self.layer.anchorPoint = CGPointMake(0, 0);
    }else {
        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    [self logLayerInfo:nil];
}
- (IBAction)scaleLayer:(id)sender {
    if (CGAffineTransformIsIdentity(self.layer.affineTransform)) {
        self.layer.affineTransform = CGAffineTransformMakeScale(1.5, 1.5);
    }else {
        self.layer.affineTransform = CGAffineTransformIdentity;
    }
    [self logLayerInfo:nil];
}
- (IBAction)translateLayer:(id)sender {
    if (CGAffineTransformIsIdentity(self.layer.affineTransform)) {
        self.layer.affineTransform = CGAffineTransformMakeTranslation(30, 40);
    }else {
        self.layer.affineTransform = CGAffineTransformIdentity;
    }
    [self logLayerInfo:nil];
}


- (IBAction)rotateLayer:(id)sender {
    if (CGAffineTransformIsIdentity(self.layer.affineTransform)) {
        self.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
    }else {
        self.layer.affineTransform = CGAffineTransformIdentity;
    }
    [self logLayerInfo:nil];
}
- (IBAction)scaleLayer3d:(id)sender {
    if (CATransform3DIsIdentity(self.layer.transform)) {
        //3个方向上的缩放,分别延x轴,y轴,z轴缩放
        self.layer.transform = CATransform3DMakeScale(0.5, 1.0, 1.0);
    }else {
        self.layer.transform = CATransform3DIdentity;
    }
    [self logLayerInfo:nil];

}
- (IBAction)translateLayer3d:(id)sender {
    if (CATransform3DIsIdentity(self.layer.transform)) {
        //z轴上的偏移,偏移的值越大,layer在z轴上面显示在前面,会在z轴上盖住偏移值较小的layer
        self.layer.transform = CATransform3DMakeTranslation(20, 20, -10);
    }else {
        self.layer.transform = CATransform3DIdentity;
    }
    [self logLayerInfo:nil];
}
- (IBAction)rotateLayer3d:(id)sender {
    if (CATransform3DIsIdentity(self.layer.transform)) {
        self.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 1);
    }else {
        self.layer.transform = CATransform3DIdentity;
    }
    [self logLayerInfo:nil];
}

@end
