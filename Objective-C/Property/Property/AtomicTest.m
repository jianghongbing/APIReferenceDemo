//
//  AtomicTest.m
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "AtomicTest.h"

@implementation AtomicTest
{
    NSInteger _atomicCount;
}

//如果属性申明为atomic,setter和getter会生成如下的格式
//- (void)setAtomicCount:(NSInteger)atomicCount {
//    @synchronized(self) {
//        _atomicCount = atomicCount;
//    }
//}
//
//- (NSInteger)atomicCount {
//    NSInteger count = 0;
//    @synchronized(self) {
//        count = _atomicCount;
//    }
//    return count;
//}


@end
