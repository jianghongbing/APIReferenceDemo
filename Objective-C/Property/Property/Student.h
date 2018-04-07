//
//  Student.h
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    NSString *_studentId;
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex
                   studentId:(NSString *)studentId;

- (void)gotoSchool;
@end
