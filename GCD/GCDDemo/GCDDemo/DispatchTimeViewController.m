//
//  DispatchTimeViewController.m
//  GCDDemo
//
//  Created by pantosoft on 2018/4/11.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DispatchTimeViewController.h"

@interface DispatchTimeViewController ()

@end

@implementation DispatchTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// NSEC_PER_SEC 1000000000ull 秒
// NSEC_PER_MSEC 1000000ull 毫秒
// USEC_PER_SEC 1000000ull 毫秒
// NSEC_PER_USEC 1000ull 微秒
    dispatch_time_t now = DISPATCH_TIME_NOW;
//    dispatch_time_t forever = DISPATCH_TIME_FOREVER;
    //delta参数,添加的纳秒数
    dispatch_time_t time = dispatch_time(now, NSEC_PER_SEC * 3.0); //相当于当前时间,3秒后的时间
    //dispatch_after:延迟执行block,其实延迟执行的并不是指block延迟执行,block都是瞬间执行的,本质是在3秒后将block加入到队列中
    NSLog(@"time:%f", CFAbsoluteTimeGetCurrent());
    dispatch_after(time, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"3秒后将block推入到队列中,然后执行block:%f", CFAbsoluteTimeGetCurrent());
    });
    
    //通过绝对时间来获取dispatchTime
    NSDate *date = [NSDate date];
    long second = date.timeIntervalSinceReferenceDate;
    struct timespec wallTime = {
        second,
        0
    };
    //如果wallTime传NULL,将以当前系统时间为基准
    time = dispatch_walltime(&wallTime, NSEC_PER_MSEC * 3000);
    NSLog(@"time:%f", CFAbsoluteTimeGetCurrent());
    dispatch_after(time, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"3秒后将block推入到队列中,然后执行block:%f", CFAbsoluteTimeGetCurrent());
    });
}
@end
