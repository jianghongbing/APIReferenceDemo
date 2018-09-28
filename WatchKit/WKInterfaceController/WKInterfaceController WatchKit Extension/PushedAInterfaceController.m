//
//  PushedInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PushedAInterfaceController.h"
NSString *const PushedAInterfaceControllerId = @"pushedAInterfaceController";
@interface PushedAInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end
@implementation PushedAInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString *parameters = [NSString stringWithFormat:@"%@", context];
    [self.label setText:parameters];
}
- (IBAction)pop {
    [self popController];
}

@end
