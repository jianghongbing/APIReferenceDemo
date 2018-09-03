//
//  GroupInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "GroupInterfaceController.h"
@interface GroupInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *group1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *group2;
@end
@implementation GroupInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configGroup1];
    [self configGroup2];
}

- (void)configGroup1 {
    [self.group1 setBackgroundColor:[UIColor orangeColor]];
    [self.group1 setCornerRadius:20];
}

- (void)configGroup2 {
    [self.group2 setBackgroundColor:[UIColor blueColor]];
    [self.group2 setContentInset:UIEdgeInsetsMake(5, 20, 10, 5)];
}

@end
