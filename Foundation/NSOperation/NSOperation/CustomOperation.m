//
//  CustomOperation.m
//  NSOperation
//
//  Created by pantosoft on 2018/1/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "CustomOperation.h"
@interface CustomOperation()
@property (nonatomic, copy, readonly) void(^block)(void);
@property (nonatomic) NSInteger count;
@end
@implementation CustomOperation
- (instancetype)initWithBlock:(void (^)(void))block excuteCount:(NSInteger)count {
    self = [super init];
    if (self) {
        _block = [block copy];
        _count = count;
    }
    return self;
}
- (void)main {
    if (self.block && !self.isCancelled) {
        while (self.count) {
            self.block();
            self.count--;
        }
    }
}
@end
