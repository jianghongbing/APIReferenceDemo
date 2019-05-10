//
//  UIViewController+addTextView.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/10.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "UIViewController+addTextView.h"
#import "CustomTextView.h"

@implementation UIViewController (addTextView)
- (UITextView *)addTextView:(NSLayoutManager *)layoutManager height:(CGFloat)height {
    return[self addTextView:[UITextView class] layoutManager: layoutManager height:height];
}

- (CustomTextView *)addCustomTextView:(NSLayoutManager *)layoutManager height:(CGFloat)height {
    return (CustomTextView *)[self addTextView:[CustomTextView class] layoutManager: layoutManager height:height];
}

- (UITextView *)addTextView:(Class)textViewClass layoutManager :(NSLayoutManager *)layoutManager height:(CGFloat)height {
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@"hello, world" attributes:@{NSForegroundColorAttributeName: [UIColor darkTextColor], NSFontAttributeName: [UIFont systemFontOfSize:12]}];
    [textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:18]} range:NSMakeRange(7, 5)];
    [textStorage addLayoutManager:layoutManager];
    UITextView *textView = [[textViewClass alloc] initWithFrame:CGRectZero textContainer:textContainer];
    textView.translatesAutoresizingMaskIntoConstraints = false;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.layer.cornerRadius = 4.0;
    [self.view addSubview:textView];
    [textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [textView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:15].active = YES;
    [textView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-15].active = YES;
    [textView.heightAnchor constraintEqualToConstant:height].active = YES;
    return textView;
}

@end
