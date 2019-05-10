//
//  OptionsViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/9.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLayoutManager *layoutManager = self.textView.layoutManager;
    layoutManager.allowsNonContiguousLayout = YES;
    layoutManager.hyphenationFactor = 1.0;
    layoutManager.showsInvisibleCharacters = YES;
    layoutManager.showsControlCharacters = YES;
    layoutManager.usesFontLeading = YES;
    
    NSAttributedString *attributeText = [[NSAttributedString alloc] initWithString:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \b\r" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor grayColor]}];
    self.textView.scrollEnabled = NO;
    self.textView.editable = NO;
    self.textView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.textView.textStorage appendAttributedString:attributeText];
}

@end
