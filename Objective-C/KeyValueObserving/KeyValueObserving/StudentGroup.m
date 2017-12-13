//
//  StudentGroup.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

void * studentsChangeContext = &studentsChangeContext;
#import "StudentGroup.h"
@interface StudentGroup()
@property (nonatomic) NSInteger groupNumber;
@property (nonatomic, strong) NSMutableArray *groupStudents;
@end
@implementation StudentGroup
- (instancetype)initWithGroupNumber:(NSInteger)groupNumber students:(NSArray *)students {
    self = [super init];
    if (self) {
        _groupNumber = groupNumber;
        _groupStudents = students.mutableCopy;
    }
    return self;
}

- (NSUInteger)countOfStudents {
    return self.groupStudents.count;
}

- (id)objectInStudentsAtIndex:(NSUInteger)index {
    if (index >= self.groupStudents.count) return nil;
    return self.groupStudents[index];
}

- (void)insertObject:(Student *)object inStudentsAtIndex:(NSUInteger)index {
    [self.groupStudents insertObject:object atIndex:index];
}

- (void)removeObjectFromStudentsAtIndex:(NSUInteger)index {
    if (index >= self.groupStudents.count) return;
    [self.groupStudents removeObjectAtIndex:index];
}

@end


@implementation StudentGroupLeader : NSObject
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath:%@\nobject:%@\nchange:%@", keyPath, object, change);
}
@end
