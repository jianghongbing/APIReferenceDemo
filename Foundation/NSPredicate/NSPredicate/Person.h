//
//  Person.h
//  NSPredicate
//
//  Created by pantosoft on 2017/8/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@end
