//
//  AtomicTest.h
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AtomicTest : NSObject
@property (atomic, assign) NSInteger atomicCount;
@property (nonatomic, assign) NSInteger nonatomicCount;
@end
