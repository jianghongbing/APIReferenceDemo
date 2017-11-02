//
//  main.m
//  NSISO8601DateFormatter
//
//  Created by pantosoft on 2017/11/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSISO8601DateFormatter:将时间格式化成ISO8601的格式或者将ISO8601格式的字符串转换成date
        NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
        
        //1.设置formatter的options
        formatter.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithFullTime;
        //2.设置formatter的timezone
        formatter.timeZone = [NSTimeZone systemTimeZone];
        //3.将date格式化成字符串
        NSString *ISO8601formatString = [formatter stringFromDate:[NSDate date]];
        NSLog(@"formatString:%@", ISO8601formatString);
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"YYYYMMddhhmmss";
        NSString *formatterString = [dateFormatter stringFromDate:[NSDate date]];
        //4.将字符串格式化成NSDate,如果字符串不符合ISO8601的格式,将会返回nil
        NSDate *date = [formatter dateFromString:formatterString];
        NSLog(@"date:%@", date);
        date = [formatter dateFromString:ISO8601formatString];
        NSLog(@"date:%@", date);

        
        
        
    }
    return 0;
}
