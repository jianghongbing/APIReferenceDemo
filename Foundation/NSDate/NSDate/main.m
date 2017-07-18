//
//  main.m
//  NSDate
//
//  Created by ; on 2017/7/9.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDate:用于表示某一时刻的时间
        //1.获取当前时间
        NSDate *date = [NSDate date];
        //2.遥远的过去和将来
        NSDate *distantFuture = [NSDate distantFuture];
        NSDate *distantPath = [NSDate distantPast];
        NSLog(@"date:%@, distantFuture:%@, distantPath:%@", date, distantFuture, distantPath);
        //3.date的创建
        NSDate *aDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 365]; //在当前时间添加多少秒
        NSLog(@"aDate:%@", aDate);
        aDate = [NSDate dateWithTimeIntervalSince1970:60 * 60 * 24 * 365 * 20]; //以1970:01:01 00:00:00开始计算
        NSLog(@"aDate:%@", aDate);
        aDate = [NSDate dateWithTimeIntervalSinceReferenceDate:60 * 60 * 24 * 365 * 10]; //以2001:01:01 00:00:00开始计算
        NSLog(@"aDate:%@", aDate);
        aDate = [date dateByAddingTimeInterval:60 * 60 * 24 * 365]; //在某一个时间的基础上,添加多少秒
        NSLog(@"aDate:%@", aDate);
        //4.获取时间戳
        NSTimeInterval timestamp = aDate.timeIntervalSinceReferenceDate * 1000;
        NSTimeInterval timestampSinceNow = aDate.timeIntervalSinceNow * 1000;
        NSTimeInterval timestampSince1970 = aDate.timeIntervalSince1970 * 1000;
        NSLog(@"timestamp:%f, %f, %f", timestamp, timestampSinceNow, timestampSince1970);
        
        //5.NSDate的比较
        BOOL isEqual = [date isEqualToDate:[NSDate date]];
        NSComparisonResult result = [aDate compare:distantPath];
        NSLog(@"isEqual:%d, result:%ld", isEqual, result);
        //6.earlierDate and laterDate
        NSDate *earlierDate = [aDate earlierDate:distantPath];
        NSDate *laterDate = [aDate laterDate:distantFuture];
        NSLog(@"earlidate:%@, laterDate:%@", earlierDate, laterDate);
        
        //7.用户手动改变系统时间的通知
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemClockDidChange:) name:NSSystemClockDidChangeNotification object:nil];
        
    }
    return 0;
}
