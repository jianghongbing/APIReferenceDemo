//
//  ViewController.m
//  NSTextStorage
//
//  Created by jianghongbing on 2019/5/4.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextStorage.h"
@interface ViewController ()<UITextViewDelegate, NSTextStorageDelegate>
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) CustomTextStorage *textStorage;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTextView];
    [self addCustomTextStorageTextView];
    [self addObservers];
    [self addChangeStorageButton];
}

- (void)dealloc {
    [self removeObservers];
}

- (void)addTextView {
    NSRange range = NSMakeRange(6, 5);
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@"hello,world"];
    [textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:30]} range:range];
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    textContainer.widthTracksTextView = YES;
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    textStorage.delegate = self;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, CGRectGetWidth(self.view.bounds) - 40, 100) textContainer:textContainer];
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.delegate = self;
    [self.view addSubview:textView];
    self.textView = textView;
}

- (void)addCustomTextStorageTextView {
    CustomTextStorage *textStorage = [[CustomTextStorage alloc] initWithString:@"hello,world"];
    self.textStorage = textStorage;
    [textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, 6)];
    [textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:30]} range:NSMakeRange(6, 5)];
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    textContainer.widthTracksTextView = YES;
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    textStorage.delegate = self;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, CGRectGetWidth(self.view.bounds) - 40, 100) textContainer:textContainer];
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    [self.view addSubview:textView];
}





- (void)addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textStorageWillProcessEditing:) name:NSTextStorageWillProcessEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textStorageDidProcessEditing:) name:NSTextStorageDidProcessEditingNotification object:nil];
}

- (void)removeObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)_textStorageWillProcessEditing:(NSNotification *)notification {
//    NSLog(@"sel:%@, notifcation:%@", NSStringFromSelector(_cmd), notification);
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));

}

- (void)_textStorageDidProcessEditing:(NSNotification *)notification {
//    NSLog(@"sel:%@, notifcation:%@", NSStringFromSelector(_cmd), notification);
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
}

- (void)addChangeStorageButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setTitle:@"changeStorage" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    button.backgroundColor = self.view.tintColor;
    button.layer.cornerRadius = 5;
    [button addTarget:self action:@selector(changeStorage:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    button.center = CGPointMake(CGRectGetMidX(self.view.bounds), 350);
    [self.view addSubview:button];
}

- (void)changeStorage:(UIButton *)button {
    [self.textStorage beginEditing];
    NSAttributedString *attributeText = [[NSAttributedString alloc] initWithString:@"hello,world" attributes:@{NSForegroundColorAttributeName: [UIColor greenColor], NSFontAttributeName: [UIFont systemFontOfSize:16]}];
    [self.textStorage replaceCharactersInRange:NSMakeRange(0, self.textStorage.length) withAttributedString:attributeText];
    [self.textStorage endEditing];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if ([self.textView isFirstResponder]) {
//        [self.textView resignFirstResponder];
//    }
    [self.view endEditing:YES];
}

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
//    NSTextStorage *textStorage = textView.textStorage;
//    NSTextStorageEditActions editedMask = textStorage.editedMask;
//    NSRange editRange = textStorage.editedRange;
//    NSInteger changeInLength = textStorage.changeInLength;
//    NSLog(@"textStorage:%@", textStorage);
//    NSLog(@"editedMask:%ld, editRange:%@, changeInLength:%ld", editedMask, NSStringFromRange(editRange), changeInLength);
}

#pragma mark NSTextStorageDelegate
- (void)textStorage:(NSTextStorage *)textStorage willProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
    NSLog(@"\n******** willProcessEditing start *******");
//    NSLog(@"method:%@", NSStringFromSelector(_cmd));
//    NSLog(@"textStorage:%@", textStorage);
//    NSLog(@"editedMask:%ld, editRange:%@, changeInLength:%ld", editedMask, NSStringFromRange(editedRange), delta);
//    BOOL fixesAttributesLazily = textStorage.fixesAttributesLazily;
//    NSLog(@"fixesAttributesLazily:%d", fixesAttributesLazily);
    NSLog(@"\n******** willProcessEditing end *******");

}


- (void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
    NSLog(@"\n******** didProcessEditing start *******");
//    NSLog(@"method:%@", NSStringFromSelector(_cmd));
//    NSLog(@"textStorage:%@", textStorage);
//    NSLog(@"editedMask:%ld, editRange:%@, changeInLength:%ld", editedMask, NSStringFromRange(editedRange), delta);
    NSLog(@"\n******** didProcessEditing end *******");
//    [textStorage beginEditing];
//    NSRange range = NSMakeRange(6, 5);
//    [textStorage invalidateAttributesInRange:range];
//    [textStorage endEditing];
}



@end
