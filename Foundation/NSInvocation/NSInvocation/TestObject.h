//
//  TestObject.h
//  NSInvocation
//
//  Created by pantosoft on 2018/4/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
- (instancetype)initWithName:(NSString *)objectName objectId:(NSString *)objectId;

+ (void)doSomething;
+ (void)doSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo;
+ (id)returnValueDoSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo;

- (void)doSomething;
- (void)doSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo;
- (id)returnValueDoSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo;
@end
