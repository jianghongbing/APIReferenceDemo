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
    
    //Layer通过代理绘制内容的理解
    //1.UIView的情况:UIView绘制自己layer的内容
    //1.1如果UIView实现了Layer的delegate方法- (void)displayLayer:(CALayer *)layer,则layer的内容在该方法中提供,即通过- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx和UIView的- (void)drawRect:(CGRect)rect方法来绘制内容没有作用
    //1.2如果UIView没有实现Layer的delegate方法:- (void)displayLayer:(CALayer *)layer.如果实现了- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx方法,则layer中的内容由该方法来绘制,即使UIView的- (void)drawRect:(CGRect)rect方法来绘制内容也没有作用
    //1.3如果UIView没有实现Layer的delegate中的上述两个方法,则可以通过- (void)drawRect:(CGRect)rect来绘制视图的内容
    //在UIView中绘制自己layer的内容,提供内容的优先级的顺序
    //如果实现- (void)displayLayer:(CALayer *)layer该方法,则View的layer的内容在该方法中提供
    //如果没有实现- (void)displayLayer:(CALayer *)layer,而实现了- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx则layer中的内容在该方法中绘制
    //如果没有- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx,也没有实现- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx,则view的layer的内容可以在UIView的-(void)drawInRect方法中绘制
    //2.非UIView的情况
    //同UIView中绘制layer的内容基本一致,只是没有UIView的drawInRect:选项
    //如果layer是一个单独的layer,将其delegate赋值给其他对象,绘制完成后,在delegate dealloc之前必须将layer的delegate置为nil,否则会产生内存泄漏,而产生异常
    
    
    //CALayerDelgate提供的方法
    //1.- (void)displayLayer:(CALayer *)layer:提供layer的内容
    //2.- (void)layerWillDraw:(CALayer *)layer:将要绘制layer中的内容的回调,如果delegate实现了- (void)displayLayer:(CALayer *)layer,该方法不会调用,该方法会在- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx之前调用
    //3.- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx:绘制layer的内容,如果delegate实现了- (void)displayLayer:(CALayer *)layer,该方法不会调用,
    //4.- (void)layoutSublayersOfLayer:(CALayer *)layer:标明layer已经布局完成,可以在该方法中精确的对sublayer进行布局
    //5.- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event:自定义动画
    self.redView = [[TestView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview: self.redView];
    [self.redView.layer setNeedsDisplay];
    
    self.orangeView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeView];
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.delegate = self;
    self.blueLayer.frame = CGRectMake(50, 250, 100, 100);
    [self.view.layer addSublayer:self.blueLayer];
    [self.blueLayer setNeedsDisplay];
//    [self.blueLayer setNeedsDisplayInRect:CGRectMake(0, 0, 50, 50)];
    
}

- (void)dealloc {
    self.blueLayer.delegate = nil;
}

#pragma mark CALayerDelegate
//- (void)displayLayer:(CALayer *)layer {
//    NSLog(@"display layer");
//}

- (void)layerWillDraw:(CALayer *)layer {
    NSLog(@"layer will draw");
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextFillRect(ctx, layer.bounds);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 5.0);
    CGRect rect = layer.bounds;
    while (rect.size.width > 0 && rect.size.height > 0) {
        CGContextAddEllipseInRect(ctx, rect);
        rect = CGRectInset(rect, 10, 10);
    }
    CGContextStrokePath(ctx);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    NSLog(@"layerSubLayers");
}

//- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
//
//}
@end
