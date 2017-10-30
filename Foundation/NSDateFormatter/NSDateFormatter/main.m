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
        //5.设置dateFormatter的区域,会影响格式化的语言
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
//        dateFormatter.locale = [NSLocale currentLocale];
        //5.设置formatter的格式化格式
//        dateFormatter.dateFormat = @"YYYY:MM:dd";
        
        
        //
        dateFormatter.generatesCalendarDates = YES;
        dateFormatter.lenient = YES;
        //设置formatterBehavior
        dateFormatter.formatterBehavior = NSDateFormatterBehaviorDefault;
        
        //6.将Date格式化成字符串, 通过style的形式来格式化
        NSString *dateString = [dateFormatter stringFromDate:now];
        NSLog(@"dateString123:%@", dateString);
        
        //7.获取dateFormatter的常见属性
        NSDate *twoDigitStartDate = dateFormatter.twoDigitStartDate;
        NSDate *defaultDate = dateFormatter.defaultDate;
        NSLog(@"twoDigitStartDate:%@,defaultDate:%@", twoDigitStartDate, defaultDate);
        
        //7.1和NSCalendar一直的相关属性
        for (NSString *eraSymbol in dateFormatter.eraSymbols) {
            NSLog(@"eraSymbol:%@", eraSymbol);
        }
        for (NSString *monthSymbol in dateFormatter.monthSymbols) {
            NSLog(@"monthSymbol:%@", monthSymbol);
        }
        
        //8.通过format的形式来格式化
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = NSDateFormatterLongStyle;
        //设置了dateFormat,会忽略dateStyle和timeStyle.将时间转换成字符串或者是字符串转换成时间都按照dateFormat的格式来进行汉族转换
        dateFormatter.dateFormat = @"YYYY:MM:dd HH:mm:ss";
        dateString = [dateFormatter stringFromDate:now];
        NSLog(@"dateString123:%@", dateString);
        
        //9.将字符串转化为date.将字符串转化成date必须要准售严格的dateFormat,如果不一致会返回nil.
//        dateFormatter.dateFormat = nil;
        NSDate *formatDate = [dateFormatter dateFromString:dateString];
        NSLog(@"date:%@", formatDate);
        
        dateFormatter.dateFormat = nil;
        dateString = @"2017/10/30 GMT+8 下午6:22:36";
        formatDate = [dateFormatter dateFromString:dateString];
        NSLog(@"date:%@", formatDate);
    }
    return 0;
}
