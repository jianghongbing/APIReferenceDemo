//
//  Student.h
//  ObjectModel
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property (nonatomic, readonly)  NSInteger studentId;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age studentId:(NSInteger)studentId;
- (void)gotoClass;
+ (void)studentClassMethodTest;
@end
