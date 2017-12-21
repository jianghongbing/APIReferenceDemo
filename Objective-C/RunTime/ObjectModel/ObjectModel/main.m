//
//  main.m
//  ObjectModel
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Objective-C对象模型
        Person *aPerson = [[Person alloc] initWithName:@"xiaoming" age:12];
        [aPerson eatting];
        [Person classTestMethod];
        Student *daming = [[Student alloc] initWithName:@"daming" age:15 studentId:001];
        [daming gotoClass];
        [Student studentClassMethodTest];
    }
    return 0;
}
