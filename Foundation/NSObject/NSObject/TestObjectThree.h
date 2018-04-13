//
//  TestObjectThree.h
//  NSObject
//
//  Created by pantosoft on 2018/4/12.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObjectTwo.h"
#import "TestObjectFour.h"
@interface TestObjectThree : TestObjectTwo
@property (nonatomic, strong) TestObjectFour *object;
- (void)instanceMethodOne;
- (void)instanceMethodTwo:(NSInteger)number;
- (NSString *)instanceMethodThree:(NSInteger)number;
@end
