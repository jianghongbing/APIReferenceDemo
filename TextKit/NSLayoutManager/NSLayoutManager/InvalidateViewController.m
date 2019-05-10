//
//  InvalidateViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/10.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "InvalidateViewController.h"
#import "UIViewController+addTextView.h"
#import "CustomTextView.h"
#import "LayoutManagerOne.h"
@interface InvalidateViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation InvalidateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [self addCustomTextView:[LayoutManagerOne new] height:200];
}

- (IBAction)invalidateLayout:(id)sender {
    NSLayoutManager *layoutManager = self.textView.layoutManager;
    NSLog(@"manager:%@", layoutManager);
//    [layoutManager.textStorage addAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} range:NSMakeRange(0, 5)];
//    [layoutManager invalidateDisplayForCharacterRange:NSMakeRange(0, 5)];
    [layoutManager invalidateDisplayForGlyphRange:NSMakeRange(0, 5)];
}

@end
