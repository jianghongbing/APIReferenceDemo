//
//  TimerViewController.m
//  NSProxy
//
//  Created by pantosoft on 2018/8/30.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TimerViewController.h"
#import "WeakProxy.h"
@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation TimerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalCount = 60;
}
- (IBAction)startTimer:(id)sender {
    if (self.timer == nil || !self.timer.isValid) {
        if (self.useWeakProxy) {
            WeakProxy *proxy = [WeakProxy weakProxyWithTarget:self];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:proxy selector:@selector(tick:) userInfo:nil repeats:YES];
        }else {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];

        }
    }
    
    
}
- (IBAction)endTimer:(id)sender {
    if (self.timer && self.timer.isValid) {
        [self.timer invalidate];
        self.totalCount = 60;
        [self updateLabel];
    }
}

- (void)tick:(NSTimer *)timer {
    self.totalCount--;
    [self updateLabel];
    NSLog(@"totalCount:%ld", self.totalCount);
    if (self.totalCount == 0) {
        [self endTimer:nil];
    }
}

- (void)dealloc {
    if (self.timer.isValid) {
        [self.timer invalidate];
    }
    NSLog(@"timerViewController dealloc");
}

- (void)updateLabel {
    self.label.text = [NSString stringWithFormat:@"%ld", self.totalCount];
}


@end
