//
//  Object.h
//  MessageForwarding
//
//  Created by pantosoft on 2018/7/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Delegate;
@interface Object : NSObject
- (instancetype)initWithDelegate:(Delegate *)delegate;
- (void)messageA;
- (void)messageB:(NSInteger)number;
@end
