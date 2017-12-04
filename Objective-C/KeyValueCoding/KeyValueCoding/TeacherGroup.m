//
//  TeacherGroup.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "TeacherGroup.h"
#import "Teacher.h"
@interface TeacherGroup()
@property (nonatomic, copy) NSString *groupName;
@end
@implementation TeacherGroup
- (instancetype)initWithName:(NSString *)groupName {
    self = [super init];
    if (self) {
        _groupName = [groupName copy];
    }
    return self;
}


- (void)insertObject:(Teacher *)object inTeachersAtIndex:(NSUInteger)index {
    [self.allTeachers insertObject:object atIndex:index];
}

- (void)removeObjectFromTeachersAtIndex:(NSUInteger)index {
    if (index >= self.allTeachers.count) return;
    [self.allTeachers removeObjectAtIndex:index];
}
@end
