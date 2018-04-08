//
//  DynamicTest.m
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DynamicTest.h"

@implementation DynamicTest
{
    NSString *_name;
    NSInteger _age;
}
@dynamic name, age; //dynamic的作用,不让编译器生成setter和getter方法以及带有下滑线的成员变量,交给开发者自己去实现方法和添加对应的成员变量,如果没有实现并且调用了属性的setter 或者gettr方法,会有异常抛出

- (void)setName:(NSString *)name {
    _name = name.copy;
}

- (NSString *)name {
    return _name;
}


- (void)setAge:(NSInteger)age {
    _age = age;
}

- (NSInteger)age {
    return _age;
}
@end
