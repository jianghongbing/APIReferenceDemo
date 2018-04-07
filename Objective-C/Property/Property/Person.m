//
//  Person.m
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex {
    self = [super init];
    if (self) {
        _name = name.copy;
        _age = age;
        _identifier = identifier.copy;
        _sex = sex;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Person:%p, name:%@, age:%ld, id:%@, sex:%d", self, _name, _age, _identifier, _sex];
}
@end

@implementation Worker
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex
                 companyName:(NSString *)companyName {
    self = [super initWithName:name age:age identifier:identifier sex:sex   ];
    if (self) {
        _companyName = companyName.copy;
    }
    return self;
}

- (void)doWork {
//    NSLog(@"name:%@, age:%ld, identifier:%@, sex:%d, companyName:%@ do work", _name, _age, _identifier, _sex, _companyName);
    NSLog(@"name:%@, age:%ld, sex:%d, companyName:%@ do work", _name, _age, _sex, _companyName);

}
@end

@implementation Person (doSomething)
- (void)doSomething {
    NSLog(@"name:%@, age:%ld, identifier:%@, sex:%d do something", _name, _age, _identifier, _sex);
}
@end

