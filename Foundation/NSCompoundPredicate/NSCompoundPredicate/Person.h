//
//  Person.h
//  NSPredicate
//
//  Created by pantosoft on 2017/8/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSInteger)age;

@property (nonatomic) NSInteger age;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *firstName;

@end
