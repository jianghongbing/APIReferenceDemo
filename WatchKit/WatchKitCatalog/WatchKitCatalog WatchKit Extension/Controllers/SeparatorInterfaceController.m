//
//  SeparatorInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SeparatorInterfaceController.h"
@interface SeparatorInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSeparator *separator1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSeparator *separator2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSeparator *separator3;

@end
@implementation SeparatorInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self.separator1 setColor:[UIColor orangeColor]];
    [self.separator2 setColor:[UIColor blueColor]];
    [self.separator3 setColor:[UIColor redColor]];
}
@end
