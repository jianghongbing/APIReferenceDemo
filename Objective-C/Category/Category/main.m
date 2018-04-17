//
//  main.m
//  Category
//
//  Created by pantosoft on 2018/4/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person+Info.h"
#import "Person+Work.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *aPerson = [[Person alloc] initWithName:@"xiaoming"];
        aPerson.identifier = @"001";
        aPerson.age = 10;
        Person.type = @"Person";
        NSLog(@"person type:%@,name:%@,age:%ld,identifier:%@", Person.type, aPerson.name, aPerson.age, aPerson.identifier);
        [aPerson doSomething];
    }
    return 0;
}
