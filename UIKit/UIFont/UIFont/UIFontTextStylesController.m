//
//  UIFontTextStylesController.m
//  UIFont
//
//  Created by pantosoft on 2018/3/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "UIFontTextStylesController.h"

@interface UIFontTextStylesController ()
@property (nonatomic, strong) NSArray<NSString *> *fontTextStyles;
@end

@implementation UIFontTextStylesController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
    self.tableView.tableFooterView = [UIView new];
    self.fontTextStyles = @[UIFontTextStyleLargeTitle, UIFontTextStyleTitle1, UIFontTextStyleTitle2, UIFontTextStyleTitle3, UIFontTextStyleHeadline, UIFontTextStyleSubheadline, UIFontTextStyleBody, UIFontTextStyleCallout, UIFontTextStyleCaption1, UIFontTextStyleCaption2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fontTextStyles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontTextStylesCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@,第%ld行", self.fontTextStyles[indexPath.row], indexPath.row];
    cell.textLabel.font = [UIFont preferredFontForTextStyle:self.fontTextStyles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIFontTextStyle fontTextStyle = self.fontTextStyles[indexPath.row];
    UIFont *preferredFont = [UIFont preferredFontForTextStyle:fontTextStyle];
    NSLog(@"%@", preferredFont);
}

@end
