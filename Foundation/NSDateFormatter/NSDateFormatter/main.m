//
//  main.m
//  NSDateFormatter
//
//  Created by pantosoft on 2017/10/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDateFormatter:将date格式化字符串或者将字符串格式化date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //将date格式化成字符串
        NSDate *now = [NSDate date];
        //1.设置date部分的格式化样式
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        //2.设置time部分的格式化样式
        dateFormatter.timeStyle = NSDateFormatterLongStyle;
        //3.设置dateFormatter的timeZone
//        dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        //4.设置dateFormatter的日历
        dateFormatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        //5.设置dateFormatter的区域
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
        //5.设置formatter的格式化格式
//        dateFormatter.dateFormat = @"YYYY:MM:dd";
        
        
        //
        dateFormatter.generatesCalendarDates = YES;
        dateFormatter.lenient = YES;
        //设置formatterBehavior
        dateFormatter.formatterBehavior = NSDateFormatterBehaviorDefault;
        
        //6.将Date格式化成字符串
        NSString *dateString = [dateFormatter stringFromDate:now];
        NSLog(@"dateString123:%@", dateString);
        
        //7.获取dateFormatter的常见属性
        NSDate *twoDigitStartDate = dateFormatter.twoDigitStartDate;
        NSDate *defaultDate = dateFormatter.defaultDate;
        NSLog(@"twoDigitStartDate:%@,defaultDate:%@", twoDigitStartDate, defaultDate);
        for (NSString *eraSymbol in dateFormatter.eraSymbols) {
            NSLog(@"eraSymbol:%@", eraSymbol);
        }
        
        
        
        
    }
    return 0;
}
