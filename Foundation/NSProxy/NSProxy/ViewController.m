//
//  ViewController.m
//  NSProxy
//
//  Created by pantosoft on 2018/8/30.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "TimerViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueTwo"]) {
        TimerViewController *timerViewController = segue.destinationViewController;
        timerViewController.useWeakProxy = YES;
    }
}

@end
