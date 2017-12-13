//
//  main.m
//  NSException
//
//  Created by pantosoft on 2017/9/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSException:一旦程序发生异常,程序将会终止,可以通过捕获异常来防止程序终止,NSException用于封装异常的相关信息
        //1.异常的创建
        //name:异常名称, reason:异常产生的原因 userInfo:异常携带的信息
//        NSException *exception = [[NSException alloc] initWithName:@"NotAnNumberException" reason:@"an invaild number you input" userInfo:nil];
        //2.异常的抛出
//        [exception raise];
        //或者同时创建和抛出
//        [NSException raise:(nonnull NSExceptionName) format:(nonnull NSString *) arguments:(struct __va_list_tag *)]
        //一旦判处异常,程序将会终止,可以在异常抛出之前将其捕获
        //Objective-C的异常捕获和Java中类似
        //1.一步步执行try中的语句,如果执行的语句没有发生异常,则会执行完整个try块中的语句
        //2.如果执行try块中的语句发生异常,则try块后面的语句不会执行,进入到catch语句块.
        //3.不管有没有发生异常,最终都会执行finally块中的代码
        NSArray *array = @[];
        @try {
            id obj = array[1];
            NSLog(@"obj:%@",obj);
        }
        @catch (NSException *e) {
            NSLog(@"name:%@,reason:%@,userInfo:%@", e.name, e.reason, e.userInfo);
            NSLog(@"%@,%@",e.callStackReturnAddresses,e.callStackSymbols); //打印堆栈信息
        }
        @finally {
            NSLog(@"最后都必须走到这里");
        }
    }
    return 0;
}
