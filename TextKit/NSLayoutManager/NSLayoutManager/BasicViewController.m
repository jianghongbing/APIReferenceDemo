//
//  ViewController.m
//  NSLayoutManager
//
//  Created by jianghongbing on 2019/5/1.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTextView];
}

- (void)addTextView {
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@"hello, world, 你好, 世界" attributes:@{NSForegroundColorAttributeName: [UIColor darkTextColor], NSFontAttributeName: [UIFont systemFontOfSize:12]}];
    [textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:18]} range:NSMakeRange(7, 5)];
    [textStorage addLayoutManager:layoutManager];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:textContainer];
    textView.translatesAutoresizingMaskIntoConstraints = false;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.layer.cornerRadius = 4.0;
    self.textView = textView;
    [self.view addSubview:textView];
    [self.textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.textView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:15].active = YES;
    [self.textView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-15].active = YES;
    [self.textView.heightAnchor constraintEqualToConstant:300].active = YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.textView.isFirstResponder) {
        [self.textView resignFirstResponder];
    }
}


@end
