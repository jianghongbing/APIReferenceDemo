//
//  LayoutInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/10/10.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LayoutInterfaceController.h"

@implementation LayoutInterfaceController

- (IBAction)logLayoutInfo {
    if (@available(watchOS 5.0, *)) {
        NSLog(@"contentSafeAreaInsets:%@, systemMinimumLayoutMargins:%@", NSStringFromUIEdgeInsets(self.contentSafeAreaInsets), NSStringFromDirectionalEdgeInsets(self.systemMinimumLayoutMargins));
    } else {
        // Fallback on earlier versions
    }
}

@end
