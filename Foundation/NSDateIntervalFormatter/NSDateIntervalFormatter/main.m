//
//  main.m
//  NSDateIntervalFormatter
//
//  Created by pantosoft on 2017/10/31.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDateIntervalFormatter:将一个时间段格式化成字符串
        NSDateIntervalFormatter *formatter = [[NSDateIntervalFormatter alloc] init];
        formatter.locale = [NSLocale currentLocale];
        formatter.calendar = [NSCalendar currentCalendar];
        formatter.timeZone = [NSTimeZone localTimeZone];
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterLongStyle;
        
        
        NSDate *startDate = [NSDate date];
        NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:30 * 24 * 60 * 60];
        
        NSString *dateIntervalString = [formatter stringFromDate:startDate toDate:endDate];
        NSLog(@"dateIntervalString:%@", dateIntervalString);
        
        //设置date格式化字符串的模板,如果没有设置则采用dateStyle和timeStyle来格式化,如果设置了则采用dateTemplate的格式来进行格式化
        formatter.dateTemplate = @"YYYYMMddHHmmss";
        dateIntervalString = [formatter stringFromDate:startDate toDate:endDate];
        NSLog(@"dateIntervalString:%@", dateIntervalString);
        
        formatter.dateTemplate = nil;
        formatter.dateStyle = NSDateFormatterFullStyle;
        formatter.timeStyle = NSDateFormatterFullStyle;
        NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
        dateIntervalString = [formatter stringFromDateInterval:dateInterval];
        NSLog(@"dateIntervalString:%@", dateIntervalString);
    }
    return 0;
}
