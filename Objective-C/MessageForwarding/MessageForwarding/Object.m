//
//  Object.m
//  MessageForwarding
//
//  Created by pantosoft on 2018/7/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Object.h"
#import "Delegate.h"
#import <objc/runtime.h>
static void dynammicMethodE(id self, SEL cmd) {
    NSLog(@"self:%@, cmd:%@", self, NSStringFromSelector(cmd));
}

static NSInteger kNumber = 0;


@implementation Object
{
    Delegate *_delegate;
}

- (instancetype)initWithDelegate:(Delegate *)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
    }
    return self;
}


- (void)messageA {
    NSLog(@"className:%@,func:%s,line:%d", NSStringFromClass([self class]), __func__, __LINE__);
}
- (void)messageB:(NSInteger)number {
    NSLog(@"className:%@,func:%s,paramter:%ld,line:%d", NSStringFromClass([self class]), __func__, number, __LINE__);
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"messageE"]) {
        return NO;
    }
    return [super respondsToSelector:aSelector];
}


#pragma mark message forwarding
+ (BOOL)resolveClassMethod:(SEL)sel { //该类方法sel是否有实现
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel { //该实例方法是否有实现,可以在该方法中为其动态添加实现
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kNumber++;
        NSLog(@"%@-kNumber:%ld", NSStringFromSelector(_cmd), kNumber);
    });
    if ([NSStringFromSelector(sel) isEqualToString:@"messageE"]) {
        class_addMethod([self class], sel, (IMP)dynammicMethodE, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kNumber++;
        NSLog(@"%@-kNumber:%ld", NSStringFromSelector(_cmd), kNumber);
    });
    if ([NSStringFromSelector(aSelector) isEqualToString:@"messageD"]) {
        return _delegate;
    }
    return [super forwardingTargetForSelector: aSelector];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kNumber++;
        NSLog(@"%@-kNumber:%ld", NSStringFromSelector(_cmd), kNumber);
    });
    if ([NSStringFromSelector(aSelector) isEqualToString:@"messageF"]) {
        return [_delegate methodSignatureForSelector:aSelector];
    }else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kNumber++;
        NSLog(@"%@-kNumber:%ld", NSStringFromSelector(_cmd), kNumber);
    });
    if ([NSStringFromSelector(anInvocation.selector) isEqualToString:@"messageF"]) {
        [anInvocation invokeWithTarget:_delegate];
    }else {
        [super forwardInvocation:anInvocation];
    }
}

@end
