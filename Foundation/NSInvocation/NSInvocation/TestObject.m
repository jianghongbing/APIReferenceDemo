//
//  TestObject.m
//  NSInvocation
//
//  Created by pantosoft on 2018/4/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
{
    NSString *_objectName;
    NSString *_objectId;
}

- (instancetype)initWithName:(NSString *)objectName objectId:(NSString *)objectId {
    self = [super init];
    if (self) {
        _objectName = objectName.copy;
        _objectId = objectId.copy;
    }
    return self;
}

+ (void)doSomething {
    NSLog(@"self:%@, class:%@,className:%@ do some thing",self, [self class], NSStringFromClass(self));
}
+ (void)doSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo {
    NSLog(@"self:%@, class:%@,className:%@ do some thing with parameter:%@, %@", self, [self class], NSStringFromClass(self),parameterOne, parameterTwo);
}

+ (id)returnValueDoSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo {
    NSLog(@"self:%@, class:%@,className:%@ do some thing",self, [self class], NSStringFromClass(self));
    return [NSString stringWithFormat:@"paramterOne:%@, parameterTwo:%@", parameterOne, parameterTwo];
}


- (void)doSomething {
    NSLog(@"self:%@,class:%@,className:%@ do some thing", self, self.class, NSStringFromClass(self.class));
}

-(void)doSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo {
    NSLog(@"self:%@,class:%@,className:%@ do some thing with parameter:%@, %@", self, self.class, NSStringFromClass(self.class), parameterOne, parameterTwo);
}

- (id)returnValueDoSomethingWithParameterOne:(id)parameterOne parameterTwo:(id)parameterTwo {
    NSLog(@"self:%@,class:%@,className:%@ return value with parameter:%@, %@", self, self.class, NSStringFromClass(self.class), parameterOne, parameterTwo);
    return [NSString stringWithFormat:@"paramterOne:%@, parameterTwo:%@", parameterOne, parameterTwo];
}

@end
