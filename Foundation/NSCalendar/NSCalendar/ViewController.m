//
//  ViewController.m
//  NSCalendar
//
//  Created by pantosoft on 2017/10/23.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSCalendar:表示日历,常用于日期时间的计算
    //1.获取当前日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    //2.设置和获取日历的相关信息
    //2.1获取日历的标识符
    NSString *calendardentifier = [calendar calendarIdentifier];
    NSLog(@"calendarIdentfier:%@", calendardentifier);
    //2.2设置和获取calendar的locale
    NSLocale *calendarLocale = [calendar locale];
    NSLog(@"calendarLocale:%@", [calendarLocale localeIdentifier]);
    //2.3设置和获取timezone
    NSTimeZone *timezone = [calendar timeZone];
    NSLog(@"timezone:%@", timezone);
    //2.4获取和设置calendar的第一个weekda的number
    NSInteger firstWeekDay = calendar.firstWeekday;
    //2.5获取和设置calendar的第一周的最小day的number
    NSInteger minimumDaysInFirstWeek = calendar.minimumDaysInFirstWeek;
    NSLog(@"firstWeekDay:%ld,mininumDaysInFirstWeek:%ld", firstWeekDay, minimumDaysInFirstWeek);
    //3.获取去相关符号
    //3.1获取纪元标识,公元公元前
    NSArray *eraSymbols = [calendar eraSymbols];
    for (NSArray *eraSymbol in eraSymbols) {
        NSLog(@"%@", eraSymbol);
    }
    //3.2获取长纪元标识
    NSArray *longEraSymbols = [calendar longEraSymbols];
    for (NSArray *longEraSymbol in longEraSymbols) {
        NSLog(@"%@", longEraSymbol);
    }
    //3.3获取月份列表
    NSArray *monthSymbols = [calendar monthSymbols];
    for (NSString *month in monthSymbols) {
        NSLog(@"%@", month);
    }
    //3.4短描述的月份列表
    NSArray *shortMonthSysbols = [calendar shortMonthSymbols];
    for (NSString *shortMonth in shortMonthSysbols) {
        NSLog(@"%@", shortMonth);
    }
    //3.5超短描述的月份列表
    NSArray *veryShortMonthSymbols = [calendar veryShortMonthSymbols];
    for (NSString *veryShortMonthSymbol in veryShortMonthSymbols) {
        NSLog(@"%@", veryShortMonthSymbol);
    }
    //3.6标准描述的月份列表
    NSArray *standaloneMonthSymbols = [calendar standaloneMonthSymbols];
    for (NSString *standaloneMonthSymbol in standaloneMonthSymbols) {
        NSLog(@"%@", standaloneMonthSymbol);
    }
    //3.7标准短描述的月份列表
    NSArray *shortStandaloneMonthSymbols = [calendar shortStandaloneMonthSymbols];
    for (NSString *shortStandaloneMonthSymbol in shortStandaloneMonthSymbols) {
        NSLog(@"%@", shortStandaloneMonthSymbol);
    }
    //3.8标准超短描述的月份列表
    NSArray *veryShortStandaloneMonthSymbols = [calendar veryShortStandaloneMonthSymbols];
    for (NSString *veryShortStandaloneMonthSymbol in veryShortStandaloneMonthSymbols) {
        NSLog(@"%@", veryShortStandaloneMonthSymbol);
    }
    //4.获取四季的描述列表
    NSArray *quarterSymbols = [calendar quarterSymbols];
    for (NSString *quarterSymbol in quarterSymbols) {
        NSLog(@"%@", quarterSymbol);
    }
    NSArray *shortQuarterSymbols = [calendar shortQuarterSymbols];
    for (NSString *shortQuarterSymbol in shortQuarterSymbols) {
        NSLog(@"%@", shortQuarterSymbol);
    }
    NSArray *standaloneQuarterSymbols = [calendar standaloneQuarterSymbols];
    for (NSString *standaloneQuarterSymbol in standaloneQuarterSymbols) {
        NSLog(@"%@", standaloneQuarterSymbol);
    }
    NSArray *shortStandaloneQuarterSymbols = [calendar shortStandaloneQuarterSymbols];
    for (NSString *shortStandaloneQuarterSymbol in shortStandaloneQuarterSymbols) {
        NSLog(@"%@", shortStandaloneQuarterSymbol);
    }
    //5.获取上下午的描述
    NSString *AMSymbol = calendar.AMSymbol;
    NSString *PMSymbol = calendar.PMSymbol;
    NSLog(@"am:%@,pm:%@", AMSymbol, PMSymbol);
    //6.日期计算
    //6.1获取某一个单元的值得最大范围和最小范围eg:如果一个月的最小范围(1-28),最大范围(1-31)
    NSRange maximumRange = [calendar maximumRangeOfUnit:NSCalendarUnitDay];
    NSRange minimumRange = [calendar minimumRangeOfUnit:NSCalendarUnitDay];
    NSLog(@"maximumRange:%@,minimumRange:%@", NSStringFromRange(maximumRange), NSStringFromRange(minimumRange));
    //6.2获取当前时间的日历中,smaller unit在big unit中的范围
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date
                                                                                                ]];
    NSLog(@"range:%@", NSStringFromRange(range));
    //6.3获取当前时间对应的smaller unit在big unit中顺序
    NSUInteger ordinality = [calendar ordinalityOfUnit:NSCalendarUnitQuarter inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    NSLog(@"ordinality:%ld", ordinality);
    //6.4根据所给的时间和unit,获取在unit中的开始时间已经该unit的结束时间和开始时间的时间差,如果返回ture,则表示可以计算,如果返回false,表示在当前unit中不可计算
    NSDate *startDate;
    NSTimeInterval timeInterval = 0.0;
    BOOL canCalculate = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:&timeInterval forDate:[NSDate date]];
    if (canCalculate) {
        NSLog(@"date:%@,timeInterval:%f", startDate, timeInterval);
    }
    
    //6.5根据dateCompnents来获取日期
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = 1989;
    dateComponents.month = 10;
    dateComponents.day = 20;
    NSDate *brithday = [calendar dateFromComponents:dateComponents];
    NSLog(@"date:%@", brithday);
    
    //6.6通过date来获取指定unit的components
    dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSLog(@"year:%ld,month:%ld,day:%ld", dateComponents.year, dateComponents.month, dateComponents.day);
    //6.7获取单一的component
    NSInteger component = [calendar component:NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSLog(@"component:%ld", component);
    //6.8在指定的date上添加components来获取新的date
    dateComponents.year = 1;
    dateComponents.month = 2;
    dateComponents.day = 3;
    NSDate *date = [calendar dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    NSLog(@"date:%@", date);
    //6.9两个不同日期之间的component的差别
    startDate = [NSDate dateWithTimeIntervalSinceNow:10000000];
    dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:startDate toDate:[NSDate date] options:0];
    NSLog(@"year:%ld,month:%ld,day:%ld", dateComponents.year, dateComponents.month, dateComponents.day);
    NSCalendar *chineseCaledar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
//    dateComponents = [chineseCaledar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
//    NSLog(@"era:%ld,year:%ld,month:%ld,day:%ld",dateComponents.era, dateComponents.year, dateComponents.month, dateComponents.day);
//
//    dateComponents.year = 2017;
//    dateComponents.month = 10;
//    dateComponents.day = 4;
//    date = [calendar dateFromComponents:dateComponents];
//    dateComponents = [chineseCaledar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
//    NSLog(@"era:%ld,year:%ld,month:%ld,day:%ld",dateComponents.era, dateComponents.year, dateComponents.month, dateComponents.day);
    
    //7.获取date的component的值
    NSInteger era, year, month, day;
    //7.1获取date在当前日历中所在的era(0代表公元前,1代表公元),year(年份),month(月份),day(日份)
    [chineseCaledar getEra:&era year:&year month:&month day:&day fromDate:[NSDate date]];
    NSLog(@"era:%ld,year:%ld,month:%ld,day:%ld", era, year, month, day);
    NSInteger yearForWeekOfYear, weekOfYear, weekDay;
    //7.2获取date在当前日历中所在的era(0代表公元前,1代表公元),yearForWeekOfYear(当前周所在的年份),weekOfYear(date所在的周,在第几周),weekDay(周几)
    [chineseCaledar getEra:&era yearForWeekOfYear:&yearForWeekOfYear weekOfYear:&weekOfYear weekday:&weekDay fromDate:[NSDate date]];
    NSLog(@"era:%ld,yearForWeekOfYear:%ld,weekOfYear:%ld,weekDay:%ld", era, yearForWeekOfYear, weekOfYear, weekDay);
    //7.3获取时分秒毫微秒
    NSInteger hour, minute,second,nanosecond;
    [chineseCaledar getHour:&hour minute:&minute second:&second nanosecond:&nanosecond fromDate:[NSDate date]];
    NSLog(@"hour:%ld,minute:%ld,second:%ld,nanoSecond:%ld", hour, minute, second, nanosecond);
    
    //7.4通过提供的component的值来创建date
    NSDate *componentDate = [calendar dateWithEra:1 year:2017 month:11 day:24 hour:20 minute:25 second:52 nanosecond:100];
    NSLog(@"date:%@",componentDate);
    componentDate = [calendar dateWithEra:1 yearForWeekOfYear:2017 weekOfYear:34 weekday:5 hour:25 minute:12 second:100 nanosecond:100];
    NSLog(@"date:%@",componentDate);
    
    //8.获取在指定的timezone下的date的所有components
    NSDateComponents *timezoneComponents = [calendar componentsInTimeZone:[NSTimeZone systemTimeZone] fromDate:[NSDate date]];
    NSLog(@"components:%@", timezoneComponents);
//    dateComponents = [[NSDateComponents alloc] init];
//    dateComponents.month = -3;
//    date = [calendar dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
//    timezoneComponents = [calendar componentsInTimeZone:[NSTimeZone systemTimeZone] fromDate:date];
//    NSLog(@"components:%@", timezoneComponents);
    //9.date的比较
    NSDate *firstDate = [NSDate date];
    dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *secondDate = [calendar dateByAddingComponents:dateComponents toDate:firstDate options:0];
    //9.1:date之间比较指定的unit和更大的unit,如比较month的时候,会自动比较比month大的unit(如year)
    NSComparisonResult result = [calendar compareDate:firstDate toDate:secondDate toUnitGranularity:NSCalendarUnitMonth];
    NSLog(@"firstDate:%@\nsecondDate:%@\nresult:%ld", firstDate,secondDate,result);
    //9.2:date之间比较指定的unit和更大的unit,如比较month的时候,会自动比较比month大的unit(如year)
    BOOL isEqual = [calendar isDate:firstDate equalToDate:secondDate toUnitGranularity:NSCalendarUnitYear];
    dateComponents.month = 0;
    dateComponents.hour = 5;
    //9.2两个date是否在同一天中
    secondDate = [calendar dateByAddingComponents:dateComponents toDate:firstDate options:0];
    BOOL isInSameDay = [calendar isDate:firstDate inSameDayAsDate:secondDate];
    NSLog(@"isEqual:%d, isInSameDay:%d", isEqual, isInSameDay);
    //9.3是否在是今天,是否是昨天,是否是明天,是否是周末
    BOOL isInToday = [calendar isDateInToday:[NSDate date]];
    BOOL isInYesterday = [calendar isDateInYesterday:[NSDate date]];
    BOOL isInTomorrow = [calendar isDateInTomorrow:[NSDate date]];
    BOOL isInWeekend = [calendar isDateInWeekend:[NSDate date]];
    NSLog(@"isInToday:%d,isInYesterDay:%d,isInTomorrow:%d,isInWeekend:%d", isInToday, isInYesterday, isInTomorrow, isInWeekend);
    //10.根据提供的date(必须在某一个周末里面),计算出该周末的开始时间,和周末的时长(以秒为单位),如果提供的date不是周六或者周六,返回false,无法计算某个周末的开始时间和时长
    NSDate *sunday = [calendar dateWithEra:1 yearForWeekOfYear:2017 weekOfYear:45 weekday:1 hour:10 minute:20 second:0 nanosecond:0];
    canCalculate = [calendar rangeOfWeekendStartDate:&startDate interval:&timeInterval containingDate:sunday];
    if (canCalculate) {
        NSLog(@"startDate:%@,timeInterval:%f", startDate, timeInterval);
    }else {
        NSLog(@"containingDate输入有误,containingDate必须是周六或者周末");
    }
    //10.1根据提供的date获取下一次周末开始时间和时长
    canCalculate = [calendar nextWeekendStartDate:&startDate interval:&timeInterval options:0 afterDate:[NSDate date]];
    if (canCalculate) {
        NSLog(@"startDate:%@,timeInterval:%f", startDate, timeInterval);
    }else {
        NSLog(@"containingDate输入有误,containingDate必须是周六或者周末");
    }
    
    //11.1获取两个date components之间的差值
    NSDateComponents  *diffComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:firstDate toDate:secondDate options:0];
    NSLog(@"diffComponents:%@", diffComponents);
    //11.2获取两个components之间各个component的差值
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *secondComponets = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate dateWithTimeIntervalSinceNow:-10000000]];
    diffComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDateComponents:firstComponents toDateComponents:secondComponets options:0];
    NSLog(@"diffComponents:%@", diffComponents);
    //11.3获取指定的date加上component的值之后的date
    date = [calendar dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:[NSDate date] options:0];
    NSLog(@"date:%@", date);
    
    //12:通过枚举的形式来匹配date和datecomponent
    NSDateComponents *matchingComponents = [[NSDateComponents alloc] init];
    matchingComponents.year = 2017;
    matchingComponents.month = 11;
    matchingComponents.day = 1;
    [calendar enumerateDatesStartingAfterDate:[NSDate date] matchingComponents:matchingComponents options:NSCalendarMatchNextTime usingBlock:^(NSDate *date, BOOL exactMatch, BOOL *stop) {
        NSLog(@"date:%@,exactMatch:%d", date, exactMatch);
    }];
    //12.1匹配dateComponents的日期
    NSDate *matchingDate = [calendar nextDateAfterDate:[NSDate date] matchingComponents:matchingComponents options:NSCalendarMatchNextTime];
    NSLog(@"matchingDate:%@", matchingDate);
    //12.2匹配unit的值的date
    matchingDate = [calendar nextDateAfterDate:[NSDate date] matchingUnit:NSCalendarUnitYear value:2015 options:NSCalendarMatchNextTime | NSCalendarSearchBackwards];
    NSLog(@"matchingDate:%@", matchingDate);
    //12.3在当前时间之后匹配时分秒的date
    matchingDate = [calendar nextDateAfterDate:[NSDate date] matchingHour:9 minute:40 second:40 options:NSCalendarMatchNextTime];
    NSLog(@"matchingDate:%@", matchingDate);
    //13通过设置某一个date的unit来计算出新的date
    NSDate *settingDate = [calendar dateBySettingUnit:NSCalendarUnitMonth value:12 ofDate:[NSDate date] options:0];
    NSLog(@"settingDate:%@", settingDate);
    
    settingDate = [calendar dateBySettingHour:9 minute:12 second:12 ofDate:[NSDate date] options:0];
    NSLog(@"settingDate:%@", settingDate);
    
    //14.date和dateComponents是否匹配:如果date的components和components匹配则返回true,否则返回false
    dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = 2017;
    dateComponents.month = 10;
    dateComponents.day = 26;
    BOOL isMatch = [calendar date:[NSDate date] matchesComponents:dateComponents];
    NSLog(@"isMatch:%d", isMatch);
}
@end
