//
//  ReloadInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ReloadInterfaceController.h"
static BOOL isVertical = NO;
NSString * const ReloadInterfaceControllerId = @"reloadInterfaceController";
@interface ReloadInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end
@implementation ReloadInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString *letter = context[@"letter"];
    [self.label setText:[letter uppercaseString]];
}

- (IBAction)reloadControllers {
    isVertical = !isVertical;
    if (isVertical) {
        [WKInterfaceController reloadRootPageControllersWithNames:@[ReloadInterfaceControllerId, ReloadInterfaceControllerId, ReloadInterfaceControllerId] contexts:@[@{@"letter": @"A"}, @{@"letter": @"B"}, @{@"letter": @"C"}] orientation: WKPageOrientationVertical pageIndex:1];
    }else {
        [WKInterfaceController reloadRootPageControllersWithNames:@[ReloadInterfaceControllerId, ReloadInterfaceControllerId, ReloadInterfaceControllerId, ReloadInterfaceControllerId] contexts:@[@{@"letter": @"A"}, @{@"letter": @"B"}, @{@"letter": @"C"}, @{@"letter": @"D"}] orientation:WKPageOrientationHorizontal  pageIndex:3];
    }
}

- (IBAction)reset {
    isVertical = NO;
    [WKInterfaceController reloadRootPageControllersWithNames:@[@"rootViewController"] contexts:@[@{}] orientation:WKPageOrientationHorizontal pageIndex:0];
}
@end
