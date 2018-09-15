//
//  SegueInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/9/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SegueInterfaceController.h"

@interface SegueInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;

@end

@implementation SegueInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSNumber *rowIndex = context[@"rowIndex"];
    [self.label setText:[NSString stringWithFormat:@"Row:%@", rowIndex]];
}

@end



