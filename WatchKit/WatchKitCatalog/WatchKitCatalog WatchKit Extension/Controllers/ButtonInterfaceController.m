//
//  ButtonInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ButtonInterfaceController.h"

@interface ButtonInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button2;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button3;
@end

@implementation ButtonInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self.button1 setTitle:@"Button1"];
    [self.button1 setBackgroundColor:[UIColor orangeColor]];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3]};
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"Button2" attributes:attributes];
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(6, 1)];
    [self.button2 setAttributedTitle:title.copy];
    
    //设置背景图片
//    [self.button3 setBackgroundImage:[UIImage imageNamed:@""]];
//    [self.button3 setBackgroundImageData:[NSData data]];
    [self.button3 setBackgroundImageNamed:@"cat60x60"];
}

- (IBAction)button1Clicked {
    [self alertWithMesssage:NSStringFromSelector(_cmd)];
}

- (IBAction)button2Clicked {
    [self alertWithMesssage:@"Disabled Button2"];
    [self.button2 setEnabled:NO];
}
- (IBAction)button3Clicked {
    [self alertWithMesssage:NSStringFromSelector(_cmd)];
}

- (void)alertWithMesssage:(NSString *)message {
    WKAlertAction *action = [WKAlertAction actionWithTitle:@"OK" style:WKAlertActionStyleDefault handler:^{
    
    }];
    [self presentAlertControllerWithTitle:nil message:message preferredStyle:WKAlertControllerStyleAlert actions:@[action]];
}

@end
