//
//  Student.m
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/3.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age studentId:(NSInteger)studentId {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
        _studentId = studentId;
    }
    return self;
}
@end
