//
//  ViewController.m
//  NSFileManager
//
//  Created by jianghongbing on 2017/7/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSFileManager:对文件的一些操作,如创建,删除,移动位置,复制等
    //NSFileManager是一个单例对象
    NSFileManager *manger = [NSFileManager defaultManager];
}

@end
