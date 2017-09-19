//
//  ErrorTestObject.h
//  NSError
//
//  Created by pantosoft on 2017/9/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
FOUNDATION_EXTERN NSString * const JHBExamErrorDescriptionKey;
@interface ErrorTestObject : NSObject
+ (BOOL)passExamWithInputScore:(NSInteger)score error:(NSError **)error;
@end
