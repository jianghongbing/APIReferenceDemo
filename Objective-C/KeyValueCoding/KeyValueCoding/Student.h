//
//  Student.h
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/3.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age studentId:(NSInteger)studentId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) NSInteger studentId;
@end
