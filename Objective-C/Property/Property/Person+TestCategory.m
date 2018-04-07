//
//  Person+TestCategory.m
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person+TestCategory.h"

@implementation Person (TestCategory)
- (void)sleep {
    NSLog(@"name:%@, age:%ld, identifier:%@, sex:%d sleep", _name, _age, _identifier, _sex);

}
@end
