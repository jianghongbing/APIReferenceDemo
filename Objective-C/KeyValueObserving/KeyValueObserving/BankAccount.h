//
//  BankAccount.h
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject
- (instancetype)initWithAccountId:(NSString *)accountId balance:(double)balance;
@property (nonatomic, copy, readonly) NSString *accountId;
@property (nonatomic, readonly) double balance;
- (void)addBalance:(double)balance;
@end
