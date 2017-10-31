//
//  main.m
//  NSDateComponentsFormatter
//
//  Created by pantosoft on 2017/10/31.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDateComponentsFormatter:将dateConponents格式化成字符串
        NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
//        NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        dateComponentsFormatter.calendar = calendar;
        //1.设置格式化单元的格式
        dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
        //2.允许被格式化的单元,下面是所有被允许NSCalendarUnit
//        NSCalendarUnitYear
//        NSCalendarUnitMonth
//        NSCalendarUnitWeekOfMonth (used to mean "quantity of weeks")
//        NSCalendarUnitDay
//        NSCalendarUnitHour
//        NSCalendarUnitMinute
//        NSCalendarUnitSecond
        NSCalendarUnit allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        dateComponentsFormatter.allowedUnits = allowedUnits;
        
        
        //3.将dateComponents格式化成字符串
//        NSCalendarUnit allUnits = NSCalendarUnitYear | NSCalendarUnitQuarter | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear;
        NSDateComponents *dateComponents = [calendar components:allowedUnits fromDate:[NSDate date]];
        NSString *formatString = [dateComponentsFormatter stringFromDateComponents:dateComponents];
        NSLog(@"formatString:%@", formatString);
        
        //4.是否允许小数的存在
        dateComponentsFormatter.allowsFractionalUnits = YES;
        //5.是否允许采用近似值,在格式化字符串前面加上about(大约)
        dateComponentsFormatter.includesApproximationPhrase = YES;
        //6.最大的unit数量
        dateComponentsFormatter.maximumUnitCount = 5;
        formatString = [dateComponentsFormatter stringFromDateComponents:dateComponents];
        NSLog(@"formatString:%@", formatString);
        //7.如果为YES,会在格式化字符串后面加上一个remaining单词
        dateComponentsFormatter.includesTimeRemainingPhrase = YES;
        formatString = [dateComponentsFormatter stringFromDateComponents:dateComponents];
        NSLog(@"formatString:%@", formatString);
        //8.是否将大的unit的值换算成到小的unit上(以小的unit为计算单位)
        dateComponentsFormatter.collapsesLargestUnit = YES;
        //9.将timeInterval格式化成字符串
        dateComponentsFormatter.allowedUnits = NSCalendarUnitMinute | NSCalendarUnitSecond;
        formatString = [dateComponentsFormatter stringFromTimeInterval:100234];
        NSLog(@"formatString:%@", formatString);
        //10.格式化连个date之间的差值
        dateComponentsFormatter.allowedUnits = allowedUnits;
        formatString = [dateComponentsFormatter stringFromDate:[NSDate date] toDate:[NSDate dateWithTimeIntervalSinceNow:-10000000]];
        NSLog(@"formatString:%@", formatString);
    }
    return 0;
}
