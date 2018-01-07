//
//  Target.h
//  NSThread
//
//  Created by jianghongbing on 2017/12/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject
- (void)excuteSelector;
- (void)excuteSelectorTwo;
+ (void)excuteSelcttorWithNumber:(NSInteger)number;
@end
