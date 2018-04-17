//
//  Person+Info.h
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person.h"

@interface Person (Info)
@property (class, nonatomic, copy) NSString *type;
@property (nonatomic) NSInteger age;
@property (nonatomic, copy) NSString *identifier;
- (void)doSomething;
@end
