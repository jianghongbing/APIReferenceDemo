//
//  CustomOperation.h
//  NSOperation
//
//  Created by pantosoft on 2018/1/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomOperation : NSOperation
- (instancetype)initWithBlock:(void(^)(void))block excuteCount:(NSInteger)count;
@end
