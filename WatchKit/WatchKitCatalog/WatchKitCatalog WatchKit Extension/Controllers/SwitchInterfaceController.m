//
//  SwitchInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SwitchInterfaceController.h"
@interface SwitchInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSwitch *switch1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSwitch *switch2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button;
@property (nonatomic, getter=isEnabledSwitch1) BOOL enabledSwitch1;
@end
@implementation SwitchInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self.switch1 setTitle:@"Switch1"];
    [self.switch1 setOn:NO];
    [self.switch1 setColor:[UIColor orangeColor]];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"Switch2" attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1], NSForegroundColorAttributeName: [UIColor orangeColor]}];
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, 1)];
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(6, 1)];
    
    [self.switch2 setAttributedTitle:title.copy];
    
    
    self.enabledSwitch1 = YES;
}

- (IBAction)switch1ValueChanged:(BOOL)isOn {
    [self.switch2 setOn:!isOn];
}
- (IBAction)switch2ValueChanged:(BOOL)isOn {
    [self.switch1 setOn:!isOn];
}
- (IBAction)enableSwitch1 {
    self.enabledSwitch1 = !self.enabledSwitch1;
    [self.switch1 setEnabled:self.enabledSwitch1];
    if (self.enabledSwitch1) {
        [self.button setTitle:@"Disable Switch1"];
    }else {
        [self.button setTitle:@"Enable Switch1"];
    }
}
@end
