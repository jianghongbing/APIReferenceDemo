//
//  PresentAInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PresentAInterfaceController.h"
NSString * const PresentAInterfaceControllerId = @"presentAInterfaceController";
@interface PresentAInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;

@end
@implementation PresentAInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString *parameters = [NSString stringWithFormat:@"%@", context];
    [self.label setText:parameters];
}
- (IBAction)dimiss {
    [self dismissController];
}
@end
