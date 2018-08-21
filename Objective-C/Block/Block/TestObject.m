//
//  TestObject.m
//  Block
//
//  Created by pantosoft on 2018/7/19.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
- (void)excuteBlock {
    if (self.testBlock) {
        self.testBlock(100, 200);
    }
}
@end
