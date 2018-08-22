//
//  WeakProxy.h
//  NSProxy
//
//  Created by pantosoft on 2018/8/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy : NSProxy
- (instancetype)initWithTarget:(id)target;
+ (instancetype)weakProxyWithTarget:(id)target;
@property (nonatomic, weak, readonly) id target;
@end
