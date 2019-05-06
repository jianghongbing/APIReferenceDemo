//
//  CustomTextStorage.h
//  NSTextStorage
//
//  Created by pantosoft on 2019/5/6.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTextStorage : NSTextStorage
- (instancetype)initWithString:(NSString *)str;
- (instancetype)initWithString:(NSString *)str attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs;
- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;
@end

NS_ASSUME_NONNULL_END
