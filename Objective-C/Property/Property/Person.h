//
//  Person.h
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
enum Sex {
    Man,
    Woman
};

typedef enum Sex Sex;

@interface Person : NSObject



{
    //声明成员变量
    @public NSString * _name;
    @protected NSInteger _age;
    @private NSString *_identifier;
    @package Sex _sex;
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex;
@end


@interface Worker: Person
{
    NSString *_companyName;
}
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                  identifier:(NSString *)identifier
                         sex:(Sex)sex
                 companyName:(NSString *)companyName;
- (void)doWork;
@end


@interface Person (doSomething)
- (void)doSomething;
@end
