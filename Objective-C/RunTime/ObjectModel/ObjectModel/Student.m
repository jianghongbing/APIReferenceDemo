//
//  Student.m
//  ObjectModel
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age studentId:(NSInteger)studentId {
    self = [super initWithName:name age:age];
    if (self) {
        _studentId = studentId;
    }
    return self;
}
- (void)gotoClass {
    NSLog(@"上课了");
}
+ (void)studentClassMethodTest {
    NSLog(@"学生类方法测试");
}
@end
