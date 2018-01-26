//
//  HierarchyViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "HierarchyViewController.h"

@interface HierarchyViewController ()
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) CALayer *orangeLayer;
@property (nonatomic, strong) CALayer *purpleLayer;
@end

@implementation HierarchyViewController
#pragma mark getter
- (CALayer *)redLayer {
    if (_redLayer == nil) {
        _redLayer = [self createLayerWithBackgroundColor:[UIColor redColor] frame:CGRectMake(100, 100, 200, 200) name:@"redLayer"];
    }
    return _redLayer;
}

- (CALayer *)blueLayer {
    if (_blueLayer == nil) {
        _blueLayer = [self createLayerWithBackgroundColor:[UIColor blueColor] frame:CGRectMake(80, 80, 100, 100) name:@"blueLayer"];
    }
    return _blueLayer;
}

- (CALayer *)orangeLayer {
    if (_orangeLayer == nil) {
        _orangeLayer = [self createLayerWithBackgroundColor:[UIColor orangeColor] frame:CGRectMake(150, 150, 200, 200) name:@"orangeLayer"];
    }
    return _orangeLayer;
}

- (CALayer *)purpleLayer {
    if (_purpleLayer == nil) {
        _purpleLayer = [self createLayerWithBackgroundColor:[UIColor purpleColor] frame:CGRectMake(250,250, 100, 100) name:@"purpleLayer"];
    }
    return _purpleLayer;
}


- (CALayer *)createLayerWithBackgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame name:(NSString *)name {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = backgroundColor.CGColor;
    layer.frame = frame;
    layer.name = name;
    return layer;
}

#pragma mark life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加subLayer
    self.view.layer.name = @"viewLayer";
    [self.view.layer addSublayer:self.redLayer];
    [self addTapGestureRecognizer];
    //2.在另外一个subLayer的上面插入subLayer,如果该layer不在当前layer的自视图中,就添该layer并且将其移动到另外一个子视图的上面,如果该subLayer已经在layer的子视图中,就将其移动到另外一个layer的上面
    [self.view.layer insertSublayer:self.orangeLayer above:self.blueLayer];
    //3.插入subLayer到指定的层次,如果该layer不在当前layer的自视图中,就添该layer并且将其移动到指定的层次,如果该subLayer已经在layer的子视图中,就直接将其移动到自定的层次
//    [self.view.layer insertSublayer:self.redLayer atIndex:0];
    //4.在另外一个subLayer的下面插入subLayer
//    [self.view.layer insertSublayer:self.redLayer below:self.orangeLayer];
//    [self.view.layer addSublayer:self.blueLayer];
    //5.获取某个layer上的所有subLayer
    NSArray *subLayers = self.view.layer.sublayers;
    [subLayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL * stop) {
        NSLog(@"layer:%@,layerName:%@", layer, layer.name);
    }];
    //6.用一个layer替换另外一个layer,会先移除oldLayer,添加newLayer
//    [self.view.layer replaceSublayer:self.purpleLayer with:self.orangeLayer];
    //6.从superLayer移除自己
//    [self.orangeLayer removeFromSuperlayer];
    
    //7. 坐标之间的转换
    //点转换:将消息接收者(self.view.layer)上面的点转化成在另外一个layer(self.redLayer,以其为参照物)上的位置,所得出的结果为(point(要转换的点).x + self.view.layer.frame.x - self.redLayer.frame.x, point.y + self.view.layer.frame.y - self.redLayer.frame.y)
    CGPoint point = [self.view.layer convertPoint:CGPointMake(50, 50) toLayer:self.redLayer];
    NSLog(@"point:%@", NSStringFromCGPoint(point));
    //将一个layer(self.orangeLayer)上的点转化成在消息接收者(self.redLayer,以其为参照物)上面的位置,所得出的结果为(point(要转换的点).x + self.orangeLayer.frame.x - self.redLayer.frame.x, point.y + self.orangeLayer.frame.y - self.redLayer.frame.y)
    point = [self.redLayer convertPoint:CGPointMake(50, 50) fromLayer:self.orangeLayer];
    NSLog(@"point:%@", NSStringFromCGPoint(point));
    //rect转换:rect转化,改变的一般都是rect.origin的值,而不会该rect的size,原理同上
    CGRect rect = [self.redLayer convertRect:CGRectMake(30, 30, 100, 100) fromLayer:self.orangeLayer];
    NSLog(@"rect:%@", NSStringFromCGRect(rect));
    rect = [self.redLayer convertRect:CGRectMake(30, 30, 100, 100) toLayer:self.orangeLayer];
    NSLog(@"rect:%@", NSStringFromCGRect(rect));
    
    //8.hitTest:hitTest某个点时,默认会返回最远的包含该点的sublayer,也就这个点在该layer中,而且该layer是所有包含该点的layer中在superLayer中层次最深(也就是index最大的那个layer),可以通过重写layer的该方法来指定其他的layer
}

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedView:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark tap gesture recognizer target action
- (void)tappedView:(UITapGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:recognizer.view];
    BOOL isContainsPoint = [self.redLayer containsPoint:[self.view.layer convertPoint:point toLayer:self.redLayer]];
    CALayer *hitTestLayer = [self.view.layer hitTest:point];
    NSLog(@"point:%@\nredLayer containts point:%@\nhitTesetLayer:%@\nname:%@",NSStringFromCGPoint(point), isContainsPoint ? @"YES" : @"NO",hitTestLayer, hitTestLayer.name);
}
#pragma mark IBAction
- (IBAction)insertLayerToAbove:(id)sender {
    [self.view.layer insertSublayer:self.blueLayer above:self.redLayer];
}
- (IBAction)insertLayerToBelow:(id)sender {
    [self.view.layer insertSublayer:self.orangeLayer below:self.redLayer];
}
- (IBAction)insertLayerAtIndex:(id)sender {
    NSUInteger index = self.view.layer.sublayers.count;
    [self.view.layer insertSublayer:self.orangeLayer atIndex:(unsigned)index];
}
- (IBAction)replaceLayer:(id)sender {
    NSArray *subLayers = self.view.layer.sublayers;
    if (![subLayers containsObject:self.orangeLayer] && ![subLayers containsObject:self.purpleLayer]) {
        [self insertLayerAtIndex:nil];
    }else if ([subLayers containsObject:self.orangeLayer]) {
        [self.view.layer replaceSublayer:self.orangeLayer with:self.purpleLayer];
    }else if ([subLayers containsObject:self.purpleLayer]) {
        [self.view.layer replaceSublayer:self.purpleLayer with:self.orangeLayer];
    }
}
- (IBAction)removeLayer:(id)sender {
    if ([self.blueLayer superlayer]) {
        [self.blueLayer removeFromSuperlayer];
    }else if ([self.orangeLayer superlayer]) {
        [self.orangeLayer removeFromSuperlayer];
    }else if ([self.purpleLayer superlayer]) {
        [self.purpleLayer removeFromSuperlayer];
    }
}
@end
