//
//  UIViewController+addTextView.h
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/10.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTextView, CustomTextViewOne;
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (addTextView)
- (UITextView *)addTextView:(NSLayoutManager *)layoutManager height:(CGFloat)height;
- (CustomTextView *)addCustomTextView:(NSLayoutManager *)layoutManager height:(CGFloat)height;
- (CustomTextViewOne *)addCustomTextViewOne:(NSLayoutManager *)layoutManager height:(CGFloat)height;
- (CustomTextViewOne *)addCustomTextViewOne:(NSLayoutManager *)layoutManager textContainer:(NSTextContainer *)textContainer height:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
