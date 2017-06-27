//
//  TestObject.h
//  NSHashTable
//
//  Created by jianghongbing on 2017/6/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
- (instancetype)initWithName:(NSString *)name;
@property (nonatomic, copy, readonly) NSString *name;

@end
