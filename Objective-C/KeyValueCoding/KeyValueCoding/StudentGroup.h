//
//  StudentGroup.h
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentGroup : NSObject
- (instancetype)initWithName:(NSString *)groupName;
@property (nonatomic, copy, readonly) NSString *groupName;
//@property (nonatomic, strong) NSArray *students;
@property (nonatomic, strong) NSArray *allStudents;
@end
