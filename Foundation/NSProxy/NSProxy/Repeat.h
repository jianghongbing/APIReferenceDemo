//
//  Repeat.h
//  NSProxy
//
//  Created by pantosoft on 2018/8/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repeat : NSObject
- (instancetype)initWithRepeatNumber:(NSUInteger)repeatNumber action:(void(^)(Repeat *repeat))action;
@property (nonatomic, copy, readonly) void(^action)(Repeat *repeat);
@property (nonatomic, readonly) NSUInteger repeatNumber;
- (void)excuteAction;
- (void)endAction;
@end
