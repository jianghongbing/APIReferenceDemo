//
//  ViewController.m
//  NSTextContainer
//
//  Created by jianghongbing on 2019/5/3.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIButton *changeTextViewBoundsButton;
@property (nonatomic,strong) NSLayoutConstraint *heightConstraint;
//@property (nonatomic,strong) NSLayoutConstraint *widthConstraint;
@property (nonatomic,strong) NSLayoutConstraint *leadingConstraint;
@property (nonatomic,strong) NSLayoutConstraint *trailingConstraint;
@property (nonatomic,strong) UIView *blueCirlcleView;
@property (nonatomic,strong) UIView *greenCircleView;
@end

@implementation ViewController
#pragma mark getter
- (UITextView *)textView {
    if (_textView == nil) {
        NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(100, 50)];
//        textContainer.size = CGSizeMake(100, 50);
//        textContainer.maximumNumberOfLines = 5;
        textContainer.lineFragmentPadding = 10;
        textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
        textContainer.widthTracksTextView = YES;
        textContainer.heightTracksTextView = YES;
        textContainer.exclusionPaths = @[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 100, 100)]];
        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
        NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@"hello,world,hello,world,hello,world,hello,world,hello,worldhello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,worldhello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,worldhello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,worldhello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,worldhello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world,hello,world"];
        [textStorage addLayoutManager:layoutManager];
        [layoutManager addTextContainer:textContainer];
        _textView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:textContainer];
        _textView.layer.borderColor = [UIColor grayColor].CGColor;
        _textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
        _textView.layer.cornerRadius = 5;
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        _textView.backgroundColor = [UIColor orangeColor];
        _textView.delegate = self;
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (UIButton *)changeTextViewBoundsButton {
    if (_changeTextViewBoundsButton == nil) {
        _changeTextViewBoundsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeTextViewBoundsButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_changeTextViewBoundsButton setTitle:@"change text view bounds" forState:UIControlStateNormal];
        _changeTextViewBoundsButton.backgroundColor = self.view.tintColor;
        [_changeTextViewBoundsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_changeTextViewBoundsButton setContentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        _changeTextViewBoundsButton.layer.cornerRadius = 5;
        [_changeTextViewBoundsButton addTarget:self action:@selector(changeTextViewBounds:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_changeTextViewBoundsButton];
    }
    return _changeTextViewBoundsButton;
}

- (UIView *)blueCirlcleView {
    if (_blueCirlcleView == nil) {
        _blueCirlcleView = [self createCircleViewWithColor:[UIColor blueColor]];
    }
    return _blueCirlcleView;
}

- (UIView *)greenCircleView {
    if (_greenCircleView == nil) {
        _greenCircleView = [self createCircleViewWithColor:[UIColor greenColor]];
    }
    return _greenCircleView;
}


- (UIView *)createCircleViewWithColor:(UIColor *)color {
    UIView *view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.layer.cornerRadius = 50;
    view.backgroundColor = color;
    view.clipsToBounds = YES;
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Move Me";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    [label sizeToFit];
    label.center = CGPointMake(50, 50);
    [view addSubview:label];
    [self.view addSubview:view];
    return view;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self updateExclusionPaths];
}

- (void)updateExclusionPaths {
    CGRect frame = self.blueCirlcleView.frame;
    CGRect convertFrame = [self.view convertRect:frame toView:self.textView];
    convertFrame.origin.x -= self.textView.textContainerInset.left;
    convertFrame.origin.y -= self.textView.textContainerInset.top;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:convertFrame];
    self.textView.textContainer.exclusionPaths = @[path];
}



- (void)setupLayout {
    NSLayoutConstraint *topConstraint = [self.textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20];
    NSLayoutConstraint *heightConstraint = [self.textView.heightAnchor constraintEqualToConstant:400];

    NSLayoutConstraint *leadingConstraint = [self.textView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20];
    NSLayoutConstraint *trailingConstraint = [self.view.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:self.textView.trailingAnchor constant:20];
//    NSLayoutConstraint *widthConstraint = [self.textView.widthAnchor constraintEqualToConstant:200];

    NSLayoutConstraint *buttonTopConstraint = [self.changeTextViewBoundsButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:20];
    NSLayoutConstraint *centerXContraint = [self.changeTextViewBoundsButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];


    [NSLayoutConstraint activateConstraints:@[topConstraint, heightConstraint, leadingConstraint, trailingConstraint, buttonTopConstraint, centerXContraint]];
    self.heightConstraint = heightConstraint;
    self.leadingConstraint = leadingConstraint;
    self.trailingConstraint = trailingConstraint;

    [self.blueCirlcleView.topAnchor constraintEqualToAnchor:self.textView.topAnchor constant:20].active = YES;;
    [self.blueCirlcleView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.blueCirlcleView.heightAnchor constraintEqualToConstant:100].active = YES;
    [self.blueCirlcleView.widthAnchor constraintEqualToConstant:100].active = YES;

//    [NSLayoutConstraint activateConstraints:@[topConstraint, heightConstraint, leadingConstraint, widthConstraint, buttonTopConstraint, centerXContraint]];
//    self.heightConstraint = heightConstraint;
//    self.widthConstraint = widthConstraint;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }



}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (!CGRectContainsPoint(self.blueCirlcleView.frame, point)) return;
    self.blueCirlcleView.center = point;
    [self updateExclusionPaths];
    [self.view layoutIfNeeded];

}


- (IBAction)changeTextViewBounds:(id)sender {
    if (self.heightConstraint.constant == 400) {
        self.heightConstraint.constant = 500;
        self.leadingConstraint.constant = 40;
        self.trailingConstraint.constant = 40;
//        self.widthConstraint.constant = 300;
    }else {
        self.heightConstraint.constant = 400;
//        self.widthConstraint.constant = 200;
        self.leadingConstraint.constant = 20;
        self.trailingConstraint.constant = 20;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark UITextVieweDelegate
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"containerSize:%@, isSimpleRectangularTextContainer:%d, exclusionPaths:%@", NSStringFromCGSize(textView.textContainer.size), textView.textContainer.isSimpleRectangularTextContainer, textView.textContainer.exclusionPaths);
}
@end
