//
//  People.h
//  NSSortDescriptor
//
//  Created by jianghongbing on 2017/8/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@end
