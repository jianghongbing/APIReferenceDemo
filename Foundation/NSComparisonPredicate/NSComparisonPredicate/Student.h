//
//  Stduent.h
//  NSComparisonPredicate
//
//  Created by pantosoft on 2018/5/4.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
- (instancetype)initWithName:(NSString *)name
                   studentId:(NSString *)studentId
                         age:(NSInteger)age;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *studentId;
@property (nonatomic, readonly) NSInteger age;
@end
