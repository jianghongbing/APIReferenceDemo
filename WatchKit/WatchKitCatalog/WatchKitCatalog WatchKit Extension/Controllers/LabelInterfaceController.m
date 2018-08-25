//
//  LabelInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/8/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LabelInterfaceController.h"

@interface LabelInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *secondLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *thirdLabel;
@end

@implementation LabelInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    //1.设置text
    [self.secondLabel setText:@"Second Label Second Label"];
    //2.设置text color
    [self.secondLabel setTextColor:[UIColor orangeColor]];
    //3.设置attribute text
    //4.Label的字体大小,numberOfLines可以通过interfaceBuilder去设置,不能通过代码来设置
    NSString *text = @"This is an Attribute Text Label";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor greenColor]}];
    NSRange range = [text rangeOfString:@"Label"];
    [attributeText setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor redColor], NSUnderlineStyleAttributeName: @1} range:range];
    [self.thirdLabel setAttributedText:attributeText.copy];
}
@end



