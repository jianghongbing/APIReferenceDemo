//
//  BankAccount.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "BankAccount.h"
@interface BankAccount()
@property (nonatomic) double balance;
@end
@implementation BankAccount
- (instancetype)initWithAccountId:(NSString *)accountId balance:(double)balance {
    self = [super init];
    if (self) {
        _accountId = accountId.copy;
        _balance = balance;
    }
    return self;
}

- (void)addBalance:(double)balance {
    if (_balance + balance < 0) {
        NSLog(@"it's not an valid balance");
        return;
    }
    _balance += balance;
}
@end
