//
//  ClassTeacher.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ClassTeacher.h"
@interface ClassTeacher()
@property (nonatomic, copy) NSString *name;
@end
@implementation ClassTeacher
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name.copy;
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath:%@\nobject:%@\nchange:%@", keyPath, object, change);
}

@end
