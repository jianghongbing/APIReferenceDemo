//
//  Stduent.m
//  NSComparisonPredicate
//
//  Created by pantosoft on 2018/5/4.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithName:(NSString *)name
                   studentId:(NSString *)studentId
                         age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name.copy;
        _studentId = studentId.copy;
        _age = age;
    }
    return self;
}
@end
