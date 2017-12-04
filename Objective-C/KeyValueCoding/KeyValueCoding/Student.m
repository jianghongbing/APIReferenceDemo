//
//  Student.m
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/3.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Student.h"
@implementation Student
@synthesize studentId = aStudentId;
@dynamic myAge;

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}

#pragma mark KVC mothods

//是否允许KVC直接访问实例变量,默认为YES
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    NSLog(@"setValue:%@ forKey:%@", value, key);
    if ([key isEqualToString:@"myAge"]) {
        _age = [value integerValue];
    }else {
        [super setValue:value forKey:key];
    }
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"age"] || [key isEqualToString:@"myAge"]) {
        _age = 0;
    }else {
        [super setNilValueForKey:key];
    }
//    @try{
//        [super setNilValueForKey:key];
//    }
//    @catch (NSException *e){
//        NSLog(@"exception:%@, name:%@", e, e.name);
//    }
//    @finally {
//        NSLog(@"finally");
//    }
}

- (id)valueForKey:(NSString *)key {
    if ([key isEqualToString:@"myAge"]) {
        return @(_age);
    }else {
        return [super valueForKey:key];
    }
}


- (id)valueForUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"myName"]) {
        return _name;
    }
    return [super valueForUndefinedKey:key];
}
@end
