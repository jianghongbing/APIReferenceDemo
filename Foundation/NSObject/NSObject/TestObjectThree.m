//
//  TestObjectThree.m
//  NSObject
//
//  Created by pantosoft on 2018/4/12.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TestObjectThree.h"

@implementation TestObjectThree
- (void)instanceMethodOne {
    NSLog(@"func:%@", NSStringFromSelector(_cmd));
}
- (void)instanceMethodTwo:(NSInteger)number {
    NSLog(@"func:%@,number:%ld", NSStringFromSelector(_cmd), number);
}
- (NSString *)instanceMethodThree:(NSInteger)number {
    return [NSString stringWithFormat:@"func:%@, number:%ld", NSStringFromSelector(_cmd), number];
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *aSelectorName = NSStringFromSelector(aSelector);
    if ([aSelectorName isEqualToString:@"testMethodOne"]) {
        return self.object;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"testMethodTwo:"]) {
        return [self.object methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"invocation:%@", anInvocation);
    SEL selector = anInvocation.selector;
    if ([self.object respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:self.object];
    }else {
        [super forwardInvocation:anInvocation];
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"description, className:%@, arrdress:%p", self.className, self];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"debugDescription, className:%@, arrdress:%p", self.className, self];
}

@end
