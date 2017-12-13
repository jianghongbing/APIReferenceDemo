//
//  StudentGroup.h
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
extern void * studentsChangeContext;

@interface StudentGroup : NSObject
- (instancetype)initWithGroupNumber:(NSInteger)groupNumber students:(NSArray<Student *> *)students;
@end


@interface StudentGroupLeader : NSObject

@end
