//
//  ViewController.m
//  NSFileManager
//
//  Created by jianghongbing on 2017/8/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSFileManager:用于对文件的管理,比如文件的保存,删除,移到另外一个位置等
    //NSFileManager是一个单例
    //1.获取app内部常用的文件路径
    [self getFilePath];
}

- (void)getFilePath {
    //1.获取app的homeDirectory
    NSString *homeDirectory = NSHomeDirectory();
}
@end
