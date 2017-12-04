//
//  StudentGroup.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "StudentGroup.h"
#import "Student.h"
@implementation StudentGroup
- (instancetype)initWithName:(NSString *)groupName {
    if (self = [super init]) {
        _groupName = [groupName copy];
    }
    return self;
}

- (NSUInteger)countOfStudents {
    return self.allStudents.count;
}

- (id)objectInStudentsAtIndex:(NSUInteger)index {
    if (index >= self.allStudents.count) return nil;
    return self.allStudents[index];
}
//
//- (NSArray *)studentsAtIndexes:(NSIndexSet *)indexes {
//    return [self.allStudents objectsAtIndexes:indexes];
//}

- (void)getStudents:(Student* __unsafe_unretained *)buffer range:(NSRange)inRange {
    return [self.allStudents getObjects:buffer range:inRange];
}

@end
