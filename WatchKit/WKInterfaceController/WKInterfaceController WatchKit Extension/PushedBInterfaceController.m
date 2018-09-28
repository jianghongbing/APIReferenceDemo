//
//  PushedBInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PushedBInterfaceController.h"
NSString *const PushedBInterfaceControllerId = @"pushedBInterfaceController";

@interface PushedBInterfaceController()

@end
@implementation PushedBInterfaceController
- (IBAction)pop {
    [self popController];
}

- (IBAction)popToRoot {
    [self popToRootController];
}
@end
