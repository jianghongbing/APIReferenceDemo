//
//  TeacherGroup.h
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherGroup : NSObject
- (instancetype)initWithName:(NSString *)groupName;
@property (nonatomic, strong) NSMutableArray *allTeachers;
@end
