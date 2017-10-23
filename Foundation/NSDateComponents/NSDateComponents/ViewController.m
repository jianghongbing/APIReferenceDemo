//
//  ViewController.m
//  NSDateComponents
//
//  Created by pantosoft on 2017/10/18.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSDateComponents:将日期以各个components的形式呈现
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    //1.设置dateComponents的时区和数据
    dateComponents.calendar = [NSCalendar currentCalendar];
    dateComponents.timeZone = [NSTimeZone systemTimeZone];
    //2.设置dateComponents各个component的值
    dateComponents.year = 2017; //设置年
    dateComponents.month = 10; //设置月
    dateComponents.day = 18; //设置日
    dateComponents.hour = 17; //设置小时
    dateComponents.minute = 12; //设置分钟
    dateComponents.second = 45; //设置秒
    dateComponents.nanosecond = 23; //设置毫秒
//    dateComponents.weekday = 2; //设置星期几,1是星期天,7是星期六
//    dateComponents.weekdayOrdinal = 2; //
//    dateComponents.weekOfYear = 12; //该年的第几周
//    dateComponents.weekOfMonth = 1; //该月的第几周
//    dateComponents.quarter = 3;//设置第几季度
//    dateComponents.leapMonth = YES; //是否为润月
//    dateComponents.yearForWeekOfYear = 100;
    //3.获取通过compomponents计算出来的日期
    NSDate *componentsDate = [dateComponents date];
    NSLog(@"date:%@",componentsDate);
    //4.以setValue的方法来设置指定component的值
    [dateComponents setValue:2018 forComponent:NSCalendarUnitYear];
    //5.获取指定component的值
    NSInteger month = [dateComponents valueForComponent:NSCalendarUnitMonth];
    componentsDate = dateComponents.date;
    NSLog(@"date:%@, month:%ld",componentsDate, month);
    //6.判断component计算出来的date是否有效
    BOOL isValidDate = [dateComponents isValidDate];
    NSLog(@"isValidDate:%d", isValidDate);
    [dateComponents setValue:65 forComponent:NSCalendarUnitMinute];
    isValidDate = [dateComponents isValidDate];
    NSLog(@"isValidDate:%d", isValidDate);
    //7.判断component计算出来的date,在指定的日历下是否有效
//    isValidDate = [dateComponents isValidDateInCalendar:[NSCalendar currentCalendar]];
}
@end
