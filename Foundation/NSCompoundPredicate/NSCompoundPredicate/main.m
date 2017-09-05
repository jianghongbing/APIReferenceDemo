//
//  main.m
//  NSCompoundPredicate
//
//  Created by pantosoft on 2017/9/5.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSCompoundPredicate:一般用于合成多个predicate,多个predicate之间存在一种逻辑(and,or,!)关系
        //1.NSCompoundPredicate的创建 NSCompoundPredicateType:subPredicates之间的逻辑关系
        Person *koby = [[Person alloc] initWithFirstName:@"Kobe" lastName:@"Bryant" age:39];
        Person *jordon = [[Person alloc] initWithFirstName:@"Michael" lastName:@"Jordan" age:54];
        Person *james = [[Person alloc] initWithFirstName:@"LeBron" lastName:@"James" age:33];
        Person *curry = [[Person alloc] initWithFirstName:@"Stephen" lastName:@"Curry" age:29];
        NSArray *nbaStars = @[koby, jordon, james, curry];
        
        NSPredicate *firstNamePredicate = [NSPredicate predicateWithFormat:@"firstName contains [c] %@", @"o"];
        NSPredicate *lastNamePredicate = [NSPredicate predicateWithFormat:@"lastName.length > 5"];
        NSPredicate *agePredicate = [NSPredicate predicateWithFormat:@"age > 30"];
        //1.NSCompoundPredicate的创建
        NSCompoundPredicate *compoundPredicate = [[NSCompoundPredicate alloc] initWithType:NSAndPredicateType subpredicates:@[firstNamePredicate, lastNamePredicate, agePredicate]];
        
        NSArray *filterStars = [nbaStars filteredArrayUsingPredicate:compoundPredicate];
        for (Person *nbaStar in filterStars) {
            NSLog(@"%@-%@ %ld", nbaStar.firstName, nbaStar.lastName, nbaStar.age);
        }
        //2.NSCompoundPredicate的遍历构造方法
//        NSCompoundPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[firstNamePredicate, lastNamePredicate, agePredicate]]; //通上面构造的pridicate一样        
        NSCompoundPredicate *orPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[firstNamePredicate, lastNamePredicate, agePredicate]];
        filterStars = [nbaStars filteredArrayUsingPredicate:orPredicate];
        for (Person *nbaStar in filterStars) {
            NSLog(@"%@-%@ %ld", nbaStar.firstName, nbaStar.lastName, nbaStar.age);
        }
        NSCompoundPredicate *notPredicate = [NSCompoundPredicate notPredicateWithSubpredicate:agePredicate];
        filterStars = [nbaStars filteredArrayUsingPredicate:notPredicate];
        for (Person *nbaStar in filterStars) {
            NSLog(@"%@-%@ %ld", nbaStar.firstName, nbaStar.lastName, nbaStar.age);
        }
    }
    return 0;
}
