//
//  DateInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/8/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DateInterfaceController.h"

@interface DateInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceDate *firstDate;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceDate *secondDate;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceDate *thirdDate;

@end

@implementation DateInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setupDates];
}

- (void)setupDates {
    [self.secondDate setCalendar:[NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese]];
    [self.thirdDate setTextColor:[UIColor orangeColor]];
    [self.thirdDate setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8 * 24 * 60 *60]];
}
@end



