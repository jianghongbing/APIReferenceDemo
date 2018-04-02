//
//  Student.h
//  NSMethodSignature
//
//  Created by pantosoft on 2018/4/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
- (instancetype)initWithName:(NSString *)name
                   studentId:(NSString *)studentId;
+ (instancetype)studentWithName:(NSString *)name studentId:(NSString *)studentId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *studentId;
- (void)gotoSchool;
- (NSInteger)examScore:(NSString *)courseName;
@end
