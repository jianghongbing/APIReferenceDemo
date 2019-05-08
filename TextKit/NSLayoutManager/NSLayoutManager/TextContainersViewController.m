//
//  TextContainersViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/8.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "TextContainersViewController.h"

@interface TextContainersViewController ()
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextStorage *textStorage;
@end

@implementation TextContainersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layoutManager = [[NSLayoutManager alloc] init];
}


- (UITextView *)createTextView {
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    textContainer.widthTracksTextView = YES;
    textContainer.heightTracksTextView = YES;
    [self.layoutManager addTextContainer:textContainer];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:textContainer];
    textView.translatesAutoresizingMaskIntoConstraints = false;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.layer.cornerRadius = 4.0;
    [self.view addSubview:textView];
    return textView;
}

@end
