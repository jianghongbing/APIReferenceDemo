//
//  ViewController.m
//  CADisplayLink
//
//  Created by pantosoft on 2018/3/1.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) CADisplayLink *displayLink;
@property (weak, nonatomic) IBOutlet UIButton *paushButton;
@property (nonatomic) NSInteger count;
@property (nonatomic) CFTimeInterval lastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *fpsLabel;
@property (nonatomic, weak) CADisplayLink *fpsDisplayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CADisplayLink:类似于NSTimer的计时器,默认当屏幕刷新(每秒刷新60次)的时候,就会向其绑定的target发送消息,和屏幕刷新保持同样的频率
    //CADisplayLink和NSTimer一样会持有target,需要注意displayLink和target之间的循环引用
    //1.CADispalyLink的创建
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startCount:)];
    //2.必须将displayLink添加到runLoop中去,否则在屏幕刷新的时候,displayLink中的target不会接收到消息
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    //3.设置displayLink自己的每秒刷新帧数,默认为60s,即target每1/60秒收到一次消息,如果定义为40,即target每1/40秒收到一次消息,不会影响到系统本身的屏幕刷新频率,最大值为系统本身的屏幕刷新频率,如果超过了60,就使用最大频率
    //    displayLink.frameInterval = 10.0; //iOS10之后不推荐使用,
    displayLink.preferredFramesPerSecond = 30.0;
    self.displayLink = displayLink;
    //4.duration:屏幕每一次刷新的间隔,如果屏幕不发生卡顿的情况,为1/60s,与displayLink无关
    //5.timestamp:屏幕上一次刷新的值,与displayLink关联,与frameInterval有关
    //6.targetTimestamp:屏幕下一次刷新的值,与displayLink关联,与frameInterval有关
    //7.pause:YES表示暂停向target发送消息,NO表示恢复向target发送消息
    //8.invalidate:使displayLink无效,从当前runloop中移除,会被runloop释放,displayLink会释放target

    CADisplayLink *fpsDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(showScreenFPS:)];
    [fpsDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.fpsDisplayLink = fpsDisplayLink;
    
    
}
- (IBAction)pauseLink:(id)sender {
    if (self.displayLink) {
        self.displayLink.paused = !self.displayLink.paused;
    }
    if (self.displayLink && self.displayLink.paused) {
        [self.paushButton setTitle:@"恢复" forState:UIControlStateNormal];
    }else if (self.displayLink && !self.displayLink.paused) {
        [self.paushButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
    
}

- (void)startCount:(CADisplayLink *)displayLink {
    double fps = 1 / (displayLink.targetTimestamp - displayLink.timestamp);
    self.countLabel.text = [NSString stringWithFormat:@"displayLinkFrame:%ld,Count:%ld", lround(fps),self.count++];
}

- (void)showScreenFPS:(CADisplayLink *)displayLink {
    double fps = 1 / (displayLink.targetTimestamp - displayLink.timestamp);
//    NSLog(@"duration:%f, timestamp:%f, targetTimestamp:%f, FPS:%f", displayLink.duration, displayLink.timestamp, displayLink.targetTimestamp, fps);
    self.fpsLabel.text = [NSString stringWithFormat:@"FPS:%ld", lround(fps)];
    
}

- (void)dealloc {
    [self.displayLink invalidate];
    [self.fpsDisplayLink invalidate];
    self.displayLink = nil;
    self.fpsDisplayLink = nil;
}

@end
