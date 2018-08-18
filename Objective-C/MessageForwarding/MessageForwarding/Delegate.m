//
//  Delegate.m
//  MessageForwarding
//
//  Created by pantosoft on 2018/7/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Delegate.h"

@implementation Delegate
- (void)messageD {
    NSLog(@"DelegateMethod:%s, line:%d", __func__, __LINE__);
}

- (void)messageF {
    NSLog(@"DelegateMethod:%s, line:%d", __func__, __LINE__);
}
@end
