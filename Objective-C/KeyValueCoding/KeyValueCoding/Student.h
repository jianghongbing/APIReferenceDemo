//
//  Student.h
//  KeyValueCoding
//
//  Created by jianghongbing on 2017/12/3.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Teacher;
@interface Student : NSObject {
@private NSString * _phoneNumber;
@public NSInteger _age;
}
- (instancetype)initWithName:(NSString *)name;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger myAge;
@property (nonatomic) NSInteger studentId;
@property (nonatomic, strong) Teacher *myTeacher;
@end
