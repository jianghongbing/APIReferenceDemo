//
//  Vehicle.h
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, readwrite)NSInteger numberOfWheels;
@end
