//
//  main.m
//  NSDateInterval
//
//  Created by pantosoft on 2017/10/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //dateInterval:表示一个时间段,开始时间和结束时间的一个范围
        //1.NSDateInterval的构造
        NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:[NSDate date] endDate:[NSDate dateWithTimeIntervalSinceNow:1000000]];
        //2.NSDateInterval常见的属性
        NSDate *startDate = dateInterval.startDate; //开始时间
        NSDate *endDate = dateInterval.endDate; //结束时间
        NSTimeInterval duration = dateInterval.duration;//结束时间和开始时间的间隔
        NSLog(@"startDate:%@\nendDate:%@\nduration:%f", startDate, endDate, duration);
        
        //其他的构建方式
        NSDateInterval *otherDateInterval = [[NSDateInterval alloc] init]; //开始时间和结束时间都为[NSDate date],duration为0;
        //更是开始时间和duration来构建dateInterval
        otherDateInterval = [[NSDateInterval alloc] initWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-1000000] duration:2000000];
        //3.dateInterval的比较
        NSComparisonResult result = [dateInterval compare:otherDateInterval];
        NSLog(@"result:%ld", result);
        //4.两个dateInterval是否有交集
        BOOL isIntersect = [otherDateInterval intersectsDateInterval:dateInterval];
        NSLog(@"isInterect:%d", isIntersect);
        //5.两个dateInterval是否相等,判断开始时间和duration是否相等
        otherDateInterval = [[NSDateInterval alloc] initWithStartDate:[NSDate date] duration:1000000];
        BOOL isEqual = [otherDateInterval isEqualToDateInterval:otherDateInterval];
        NSLog(@"isEqual:%d", isEqual);
        //6.获取两个时间的交集,如果没有交集则返回nil
        otherDateInterval = [[NSDateInterval alloc] initWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-1000000] duration:1500000];
        NSDateInterval *intersectInterval = [otherDateInterval intersectionWithDateInterval:dateInterval];
        NSLog(@"intersectInterval:%@", intersectInterval);
        //7.判断某个时间是否在当前时间段内容
        BOOL isContain = [intersectInterval containsDate:[NSDate date]];
        NSLog(@"isContain:%d", isContain);
    }
    return 0;
}
