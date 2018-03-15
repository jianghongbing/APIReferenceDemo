//
//  FontNamesController.m
//  UIFont
//
//  Created by pantosoft on 2018/3/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "FontNamesController.h"

@interface FontNamesController ()
@property (nonatomic, strong) NSArray *familyNames;
@end

@implementation FontNamesController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取安装的字体家族名称的集合
    self.familyNames = [UIFont familyNames];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *familyName = self.familyNames[section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontNamesCell" forIndexPath:indexPath];
    NSString *familyName = self.familyNames[indexPath.section];
    //获取某一个字体家族里面所有的字体名称
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    cell.textLabel.text = fontNames[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.familyNames[section];
}

@end
