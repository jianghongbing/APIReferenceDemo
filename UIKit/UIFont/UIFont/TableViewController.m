//
//  TableViewController.m
//  UIFont
//
//  Created by pantosoft on 2018/3/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    //1.字体的创建
    //优先字体的创建
        UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    //创建兼容某种环境的字体
//    preferredFont = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1 compatibleWithTraitCollection:nil]
    //    UIFontTextStyleLargeTitle:大标题样式
    //    UIFontTextStyleTitle1:标题1样式
    //    UIFontTextStyleTitle2:标题2样式
    //    UIFontTextStyleTitle3:标题3样式
    //    UIFontTextStyleHeadline:主标题样式
    //    UIFontTextStyleSubheadline:副标题样式
    //    UIFontTextStyleBody:正文字体样式
    //    UIFontTextStyleCallout:插图编号字体样式
    //    UIFontTextStyleFootnote:脚注字体样式
    //    UIFontTextStyleCaption1:说明字体1样式
    //    UIFontTextStyleCaption2:说明字体2样式
    //通过字体名称来创建字体,size必须大于0
//    font = [UIFont fontWithName:@"" size:14];
    font = [UIFont systemFontOfSize:15.0];
}
@end
