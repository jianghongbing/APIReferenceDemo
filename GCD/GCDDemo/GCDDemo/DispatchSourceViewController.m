//
//  DispatchSourceViewController.m
//  GCDDemo
//
//  Created by pantosoft on 2018/4/11.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DispatchSourceViewController.h"

@interface DispatchSourceViewController ()
@property (nonatomic, strong) dispatch_source_t timer;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic) NSInteger count;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *suspendButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end

@implementation DispatchSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startButton.enabled = YES;
    self.suspendButton.enabled = NO;
    self.cancelButton.enabled = NO;
    self.count = 60;
    self.countLabel.text = [NSString stringWithFormat:@"%ld", self.count];
}

- (void)dealloc {
    NSLog(@"dispatch timer test");
//    if (self.timer && !dispatch_source_testcancel(self.timer)) {
//        dispatch_resume(self.timer);
//    }
}

- (IBAction)startTimer:(UIButton *)button {
    //timer是否cancel
    if (!self.timer || dispatch_source_testcancel(self.timer)) {
        __weak typeof(self) weakSelf = self;
        //DispatchSource目前常用到的场景就是dispatch timer,和NSTimer的功能类似,提供一个定时器的作用
        //创建dispatch_source,type一定要传入对应的类型
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        //设置timer,第一个参数传入timer,第二个是timer开始的时间,第三个参数是定时器的间隔,第四个参数偏差,timer可能会延迟回调的执行
        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0);
        //设置timer执行过程中的回调
        dispatch_source_set_event_handler(self.timer, ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.countLabel.text = [NSString stringWithFormat:@"%ld", strongSelf.count];
            strongSelf.count--;
            if (strongSelf.count == 0) {
                strongSelf.count = 60;
            }
        });
        //设置终止timer的回调
        dispatch_source_set_cancel_handler(self.timer, ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.count = 60;
            strongSelf.countLabel.text = [NSString stringWithFormat:@"%ld", strongSelf.count];
        });
    }
    dispatch_resume(self.timer); //开启timer
    button.enabled = NO;
    self.suspendButton.enabled = YES;
    self.cancelButton.enabled = YES;
}



- (IBAction)suspendTimer:(UIButton *)button {
    dispatch_suspend(self.timer); //暂停timer
    //下面这两行代码消除崩溃,当前timer suspend的时候,如果将timer设置为nil,会导致程序崩溃
    dispatch_resume(self.timer);
    dispatch_source_cancel(self.timer);
    self.startButton.enabled = YES;
    button.enabled = NO;
    self.cancelButton.enabled = NO;
}

- (IBAction)cancelTimer:(UIButton *)button {
    dispatch_source_cancel(self.timer); //cancel timer
    self.startButton.enabled = YES;
    self.suspendButton.enabled = NO;
    button.enabled = NO;
}
@end
