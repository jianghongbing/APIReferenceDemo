//
//  DrawLayerViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DrawLayerViewController.h"
#import "DrawLayer.h"
@interface DrawLayerViewController ()<CALayerDelegate>
@property (nonatomic, strong) DrawLayer *drawLayer;
@property (nonatomic, strong) DrawLayer *drawLayerTwo;
@property (nonatomic, strong) CALayer *delegateLayer;
@end

@implementation DrawLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawLayer = [DrawLayer layer];
    self.drawLayer.frame = CGRectMake(20, 100, 200, 200);
    self.drawLayer.needsDisplayOnBoundsChange = YES;
    [self.view.layer addSublayer:self.drawLayer];
    [self.drawLayer setNeedsDisplay];
    
    self.drawLayerTwo = [DrawLayer layer];
    self.drawLayerTwo.frame = CGRectMake(20, 350, 150, 100);
    self.drawLayerTwo.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.drawLayerTwo];
    [self.drawLayerTwo setNeedsDisplay];
    
    self.delegateLayer = [CALayer layer];
    self.delegateLayer.frame = CGRectMake(300, 350, 100, 100);
    self.delegateLayer.backgroundColor =[UIColor blackColor].CGColor;
    self.delegateLayer.delegate = self;
    [self.view.layer addSublayer:self.delegateLayer];
    [self.delegateLayer setNeedsDisplay];
    
    
    //1.layer内容的绘制: CoreAnimation是建立在CoreGraphics的上面的,因此可以通过CoreGraphics来绘制layer的内容
    //通过自定义layer,重写drawInContext:来绘制layer的内容
    //通过layer的delegate,实现layer的delegate方法:- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx来绘制layer的内容
    //layer的drawInContext:方法不会像UIView的drwaInRect那样,在layer创建的时候不会调用drawInContext方法,需要通过setNeedDisplay来手动刷新绘制layer的内容
    //2.layer内容的刷新
    //display:刷新layer的内容,会给layer发送drwaInContext方法,apple建议不要直接调用该方法,通过调用setNeedDisplay方法来刷新layer的content
    //setNeedDisplay:从新刷新layer的内容,
    //- (void)setNeedsDisplayInRect:(CGRect)r:刷新某rect中的layer的内容
    //needsDisplayOnBoundsChange:当layer的bounds发生改变时,是否自动刷新layer的内容
    //- (void)displayIfNeeded:只有在layer的内容需要刷新的时候,才刷新layer的内容
    //- (BOOL)needsDisplay:判断layer是否需要更新内容
    //+ (BOOL)needsDisplayForKey:(NSString *)key:判断当改变key的值时,是否需要刷新layer的内容
}
- (IBAction)changeLayerBounds:(id)sender {
    if (CGRectEqualToRect(self.drawLayer.bounds, CGRectMake(0, 0, 200, 200))) {
        self.drawLayer.bounds = CGRectMake(0, 0, 150, 150);
        self.drawLayerTwo.bounds = CGRectMake(0, 0, 200, 200);
    }else {
        self.drawLayer.bounds = CGRectMake(0, 0, 200, 200);
        self.drawLayerTwo.bounds = CGRectMake(0, 0, 150, 150);
    }
}

- (IBAction)forceDisplay:(id)sender {
    self.drawLayer.strokeColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
    self.drawLayer.fillColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
    [self.delegateLayer setNeedsDisplay];
}

- (void)dealloc {
    self.delegateLayer.delegate = nil;
}

#pragma mark CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    if (layer != self.delegateLayer) return;
    NSLog(@"func:%s", __func__);
    CGContextSetLineWidth(ctx, 5.0);
    CGRect rect = layer.bounds;
    while (rect.size.width > 0 && rect.size.height > 0) {
        CGContextAddRect(ctx, rect);
        rect = CGRectInset(rect, 10, 10);
        CGContextSetRGBStrokeColor(ctx, arc4random_uniform(255) / 255.0, arc4random_uniform(255) / 255.0, arc4random_uniform(255) / 255.0, 1.0);
        CGContextStrokePath(ctx);
    }
}
@end
