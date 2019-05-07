//
//  CustomTextContainerViewController.m
//  NSTextContainer
//
//  Created by pantosoft on 2019/5/7.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "CustomTextContainerViewController.h"
#import "CustomTextContainer.h"
@interface CustomTextContainerViewController ()

@end

@implementation CustomTextContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTextView];
}

- (void)addTextView {
    CustomTextContainer *textContainer = [[CustomTextContainer alloc] init];
    textContainer.widthTracksTextView = YES;
    textContainer.heightTracksTextView = YES;
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@"***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************"];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:textContainer];
    textView.translatesAutoresizingMaskIntoConstraints = false;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.layer.cornerRadius = 3;
    textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    textView.textColor = [UIColor redColor];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    [self.view addSubview:textView];
    [textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:16].active = YES;
    [textView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [textView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-16].active = YES;
    [textView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-16].active = YES;
}

@end
