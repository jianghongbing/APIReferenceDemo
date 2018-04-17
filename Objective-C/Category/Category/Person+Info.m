//
//  Person+Info.m
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person+Info.h"
#import <objc/runtime.h>

static NSString *kAgeKey;
static NSString *kIdentifierKey;
static NSString *kTypeKey;

@implementation Person (Info)

+ (void)load {
    NSLog(@"category load, categoryName:Person(Info)");
}

+ (NSString *)type {
    return objc_getAssociatedObject(self, &kTypeKey);
}

+ (void)setType:(NSString *)type {
    objc_setAssociatedObject(self, &kTypeKey, type, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSInteger)age {
    return [objc_getAssociatedObject(self, &kAgeKey) integerValue];
}

- (void)setAge:(NSInteger)age {
    objc_setAssociatedObject(self, &kAgeKey, @(age), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)identifier {
    return objc_getAssociatedObject(self, &kIdentifierKey);
}

- (void)setIdentifier:(NSString *)identifier {
    objc_setAssociatedObject(self, &kIdentifierKey, identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)doSomething {
    NSLog(@"do some thing two");
}
@end
