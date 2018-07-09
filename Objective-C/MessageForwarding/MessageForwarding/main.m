//
//  main.m
//  MessageForwarding
//
//  Created by pantosoft on 2018/7/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object.h"
#import "Delegate.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        (void)instrumentObjcMessageSends(YES);
        Object *obj = [[Object alloc] init];
        [obj messageA];
        [obj performSelector:@selector(messageE) withObject:nil];
        NSLog(@"respondsToSelector:%@", [obj respondsToSelector:@selector(messageE)] ? @"YES" : @"NO");
        obj = [[Object alloc] initWithDelegate:[Delegate new]];
        [obj performSelector:@selector(messageD) withObject:nil];
        [obj performSelector:@selector(messageF) withObject:nil];
    }
    return 0;
}
