//
//  InputInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "InputInterfaceController.h"
@interface InputInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *inputValueLabel;
@end
@implementation InputInterfaceController
- (IBAction)inputTextPlain {
    [self inputWithMode:WKTextInputModePlain];
//    __weak typeof(self) weakSelf = self;
//    [self presentTextInputControllerWithSuggestions:@[@"A", @"B",@"C", @"D"] allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        NSString *inputText = results.firstObject;
//        [strongSelf.inputValueLabel setText:inputText];
//    }];
    
    //通过不同的语言来设置不同的选项
//    [self presentTextInputControllerWithSuggestionsForLanguage:^NSArray *(NSString *inputLanguage) {
////        if ([inputLanguage isEqualToString:@"en_US"]) {
////        }else if
//        NSLog(@"inputLanguage:%@", inputLanguage);
//        return @[@"A", @"B",@"C", @"D"];
//    } allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        NSString *inputText = results.firstObject;
//        [strongSelf.inputValueLabel setText:inputText];
//    }];
}

- (IBAction)inputEmoji {
    [self inputWithMode:WKTextInputModeAllowEmoji];
}

- (IBAction)inputAnimateEmoji {
    [self inputWithMode:WKTextInputModeAllowAnimatedEmoji];

}


- (void)inputWithMode:(WKTextInputMode)mode {
    __weak typeof(self) weakSelf = self;
    [self presentTextInputControllerWithSuggestions:@[@"A", @"B",@"C", @"D"] allowedInputMode:mode completion:^(NSArray *results) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSString *inputText = results.firstObject;
        [strongSelf.inputValueLabel setText:inputText];
    }];
}

@end
