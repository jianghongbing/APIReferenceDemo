//
//  WeakProxy.m
//  NSProxy
//
//  Created by pantosoft on 2018/8/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy
- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+ (instancetype)weakProxyWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}

#pragma mark mathod override
- (BOOL)isProxy {
    return YES;
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (id)performSelector:(SEL)aSelector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [_target performSelector:aSelector];
#pragma clang diagnostic pop
}

- (id)performSelector:(SEL)aSelector withObject:(id)object {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [_target performSelector:aSelector withObject:object];
#pragma clang diagnostic pop
}

- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [_target performSelector:aSelector withObject:object1 withObject:object2];
#pragma clang diagnostic pop

}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

#pragma mark method forwarding
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:_target];
//    [_target forwardInvocation:invocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_target methodSignatureForSelector:sel];
}

@end
