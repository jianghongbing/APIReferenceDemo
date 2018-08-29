//
//  PayButtonInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PayButtonInterfaceController.h"
@interface PayButtonInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePaymentButton *payButton1;

@end
@implementation PayButtonInterfaceController
- (IBAction)payButtonClicked {
    WKAlertAction *action = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleDefault handler:^{}];
    [self presentAlertControllerWithTitle:@"Apple Pay" message:@"pay button clicked" preferredStyle:WKAlertControllerStyleActionSheet actions:@[action]];
}

@end
