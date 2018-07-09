//
//  Subobject.m
//  MessageForwarding
//
//  Created by pantosoft on 2018/7/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Subobject.h"

@implementation Subobject
- (void)messageC:(NSInteger)parameterOne parameterTwo:(NSInteger)parameterTwo {
    NSLog(@"className:%@,func:%s,paramterOne:%ld,parameterTwo:%ld,line:%d", NSStringFromClass([self class]), __func__, parameterOne, parameterTwo, __LINE__);
}
@end
