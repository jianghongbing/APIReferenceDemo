//
//  TestObject.h
//  Block
//
//  Created by pantosoft on 2018/7/19.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
@property (nonatomic, copy) void(^testBlock)(int, int);
- (void)excuteBlock;
@end
