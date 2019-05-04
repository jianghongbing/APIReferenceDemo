//
//  ViewController.m
//  NSLayoutManager
//
//  Created by jianghongbing on 2019/5/1.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
//    NSTextStorage *storage = [[NSTextStorage alloc] init];
//    layoutManager.textStorage = storage;

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40, 100) textContainer:nil];
    textView.backgroundColor = [UIColor orangeColor];
    textView.text = @"hello,world";
    [self.view addSubview:textView];
    NSLog(@"layoutManager:%@\ntextContainer:%@\nstorage:%@", textView.layoutManager, textView.textContainer, textView.textStorage);
//    textView.layoutManager = layoutManager;

}


@end
