//
//  Student.m
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex
                   studentId:(NSString *)studentId {
    self = [super initWithName:name age:age identifier:identifier sex:sex];
    if (self) {
        _studentId = studentId.copy;
    }
    return self;
}

- (void)gotoSchool {
    //私有成员变量在子类中,不能访问
//    NSLog(@"name:%@,age:%ld,identifier:%@,sex:%ld,studentId:%@", _name, _age, _identifier, _sex, _studentId);
    NSLog(@"name:%@,age:%ld,sex:%d,studentId:%@", _name, _age, _sex, _studentId);
}

@end
