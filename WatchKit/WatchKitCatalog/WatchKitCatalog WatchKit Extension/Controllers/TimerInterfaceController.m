//
//  TimerInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/8/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TimerInterfaceController.h"

@interface TimerInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTimer *firstTimer;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTimer *secondTimer;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTimer *thirdTimer;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button;
@property (nonatomic, getter=isStopped) BOOL stopped;
@end

@implementation TimerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setupTimers];
}



- (void)setupTimers {
    [self.firstTimer setDate:[NSDate date]];
    [self.secondTimer setDate:[NSDate dateWithTimeIntervalSinceNow:60]];
    [self.thirdTimer setDate:[NSDate date]];
    [self.thirdTimer setTextColor:[UIColor orangeColor]];
}
- (IBAction)stopOrStartTimer {
    self.stopped = !self.isStopped;
    if (self.isStopped) {
        [@[self.firstTimer, self.secondTimer, self.thirdTimer] makeObjectsPerformSelector:@selector(stop)];
        [self.button setTitle:@"Start"];
    }else {
        [@[self.firstTimer, self.secondTimer, self.thirdTimer] makeObjectsPerformSelector:@selector(start)];
        [self.button setTitle:@"Stop"];
    }
}
@end



