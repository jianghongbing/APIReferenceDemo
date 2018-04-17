//
//  Person.h
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
- (instancetype)initWithName:(NSString *)name;
@property (nonatomic, copy, readonly) NSString *name;
- (void)doSomething;
@end
