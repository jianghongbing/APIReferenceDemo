//
//  Person.h
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/10.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age brithday:(NSDate *)brithday;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, copy, readonly) NSDate *brithday;
@end
