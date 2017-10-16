//
//  ViewController.m
//  NSTimeZone
//
//  Created by pantosoft on 2017/10/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSTimeZone:代表一个时区
    //1.获取所有已知的timeZoneName
    NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
    for (NSString *timeZoneName in timeZoneNames) {
        NSLog(@"timeZoneName:%@", timeZoneName);
    }
    //2.获取各个时区的缩写信息
    NSDictionary *abbreviationDictionarys = [NSTimeZone abbreviationDictionary];
    [abbreviationDictionarys enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        NSLog(@"key:%@,value:%@", key, value);
    }];
    //3.获取timeZoneVersion data的版本
    NSString *timeZoneDataVersion = [NSTimeZone timeZoneDataVersion];
    NSLog(@"timeZoneDataVersion:%@", timeZoneDataVersion);
    //4.获取timezone
    NSTimeZone *defaultTimeZone = [NSTimeZone defaultTimeZone];
    //5.获取timeZone的信息
    NSString *timeZoneName = defaultTimeZone.name; //timeZone的名字
    NSData *data = defaultTimeZone.data; //timeZone的数据
    NSInteger secondsFromGMT = [defaultTimeZone secondsFromGMT]; //时间差
    NSString *abbreviation = [defaultTimeZone abbreviation];//缩写信息
    BOOL isDaylightSavingTime = [defaultTimeZone isDaylightSavingTime]; //是否使用夏令时
    NSTimeInterval daylightSavingTimeOffset = [defaultTimeZone daylightSavingTimeOffset]; //夏令时时间偏移
    NSDate *nextDaylightSavingTimeTransition = [defaultTimeZone nextDaylightSavingTimeTransition];//下一次夏令时转变的时间
    NSLog(@"timeZoneName:%@\ndata:%@\nsecondsFromGMT:%ld\nabbreviation:%@\nisDaylightSavingTime:%d\ndaylightSaveTimeOffset:%f\nnextDaylightSavingTimeTransition:%@", timeZoneName, data, secondsFromGMT, abbreviation, isDaylightSavingTime, daylightSavingTimeOffset, nextDaylightSavingTimeTransition);
    
    //6.获取localeTimeZone和systemTimeZone
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];
    NSLog(@"localTimeZone:%@,systemTimeZone:%@", localTimeZone, systemTimeZone);
    //7.timezone的比较
    BOOL isEqual = [defaultTimeZone isEqualToTimeZone:localTimeZone];
    NSLog(@"isEqual:%d", isEqual);
    isEqual = [localTimeZone isEqualToTimeZone:systemTimeZone];
    NSLog(@"isEqual:%d", isEqual);
}

@end
