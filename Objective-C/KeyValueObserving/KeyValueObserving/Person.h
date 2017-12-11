//
//  Person.h
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void * balanceContext;
@interface Person : NSObject
- (instancetype)initWithName:(NSString *)name;
@property (nonatomic, copy, readonly) NSString *name;
@end
