//
//  Student.m
//  NSMethodSignature
//
//  Created by pantosoft on 2018/4/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithName:(NSString *)name studentId:(NSString *)studentId {
    self = [super init];
    if (self) {
        _name = name.copy;
        _studentId = studentId.copy;
    }
    return self;
}

+ (instancetype)studentWithName:(NSString *)name studentId:(NSString *)studentId {
    return [[self alloc] initWithName:name studentId:studentId];
}


- (void)gotoSchool {
    NSLog(@"it is time to goto school");
}
- (NSInteger)examScore:(NSString *)courseName {
    NSLog(@"courseName:%@", courseName);
    return  arc4random_uniform(100);
}
@end
