//
//  main.m
//  NSError
//
//  Created by pantosoft on 2017/9/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorTestObject.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSError:用于处理程序出现error,而不需要使程序因为error而终止,NSError在cocoa程序中使用非常频繁,封装出现error的信息
        //1.NSError:常用于以指针的指针的形式作为一参数传递给某一个方法使用
        NSError *error = nil;
        NSString *path = @"anErrorPath";
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSLog(@"code:%ld\ndomain:%@\nuserInfo:%@", error.code, error.domain, error.userInfo);
        }else {
            NSLog(@"string:%@", string);
        }
        
        NSError *examError = nil;
        BOOL isPassExam = [ErrorTestObject passExamWithInputScore:-20 error:&examError];
        if (examError) {
            NSLog(@"examErrorCode:%ld\ndomain:%@\nuserInfo:%@\nlocalDescription:%@", examError.code, examError.domain, examError.userInfo, examError.localizedDescription);
        }else if(isPassExam) {
            NSLog(@"you pass exam");
        }else {
            NSLog(@"you donot pass exam");
        }
        
        examError = nil;
        isPassExam = [ErrorTestObject passExamWithInputScore:104 error:&examError];
        if (examError) {
            NSLog(@"examErrorCode:%ld\ndomain:%@\nuserInfo:%@\nlocalDescription:%@", examError.code, examError.domain, examError.userInfo, examError.localizedDescription);
        }else if(isPassExam) {
            NSLog(@"you pass exam");
        }else {
            NSLog(@"you donot pass exam");
        }
        examError = nil;
        isPassExam = [ErrorTestObject passExamWithInputScore:78 error:&examError];
        if (examError) {
            NSLog(@"examErrorCode:%ld\ndomain:%@\nuserInfo:%@\nlocalDescription:%@", examError.code, examError.domain, examError.userInfo, examError.localizedDescription);
            
        }else if(isPassExam) {
            NSLog(@"you pass exam");
        }else {
            NSLog(@"you donot pass exam");
        }
        
    }
    return 0;
}
