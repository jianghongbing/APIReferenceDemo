//
//  ErrorTestObject.m
//  NSError
//
//  Created by pantosoft on 2017/9/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ErrorTestObject.h"
NSString * const JHBExamErrorDescriptionKey = @"JHBExamErrorDescription";
@implementation ErrorTestObject
+ (BOOL)passExamWithInputScore:(NSInteger)score error:(NSError **)error {
    if (score >= 0 && score <= 100) {
        if (score >= 60) {
            return YES;
        }else {
            return NO;
        }
    }else  {
        NSString *errorDomain = @"com.exam.error";
        if (score < 0) {
            //1.error的创建
            *error = [NSError errorWithDomain:errorDomain code:100 userInfo:@{JHBExamErrorDescriptionKey : @"input score cannot be less than 0", NSLocalizedDescriptionKey : @"输入的分数不能小于0"}];
        }else if (score > 100) {
            *error = [[NSError alloc] initWithDomain:errorDomain code:101 userInfo:@{JHBExamErrorDescriptionKey : @"input score cannot be greater than 100", NSLocalizedDescriptionKey : @"输入的分数不能大于0"}];
        }
    }
    return NO;
}
@end
