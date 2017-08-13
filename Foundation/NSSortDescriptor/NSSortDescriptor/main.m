//
//  main.m
//  NSSortDescriptor
//
//  Created by jianghongbing on 2017/8/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSSortDescriptor:用于有序集合的排序
        People *peopleOne = [[People alloc] initWithName:@"zhangsan" age:10];
        People *peopleTwo = [[People alloc] initWithName:@"wangwu" age:13];
        People *peopleThree = [[People alloc] initWithName:@"zhangsan" age:8];
        People *peopleFour = [[People alloc] initWithName:@"lisi" age:13];
        NSArray *peopleArry = @[peopleOne, peopleTwo, peopleThree, peopleFour];
        //key必须遵守KVC规则
        NSSortDescriptor *nameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sortedArray = [peopleArry sortedArrayUsingDescriptors:@[nameSortDescriptor]];
        [sortedArray enumerateObjectsUsingBlock:^(People *people, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"name:%@, age:%ld", people.name, people.age);
        }];

        NSSortDescriptor *ageSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES comparator:^NSComparisonResult(NSNumber *ageOne, NSNumber *ageTwo) {
            return [ageOne compare:ageTwo];
        }];

        sortedArray = [peopleArry sortedArrayUsingDescriptors:@[nameSortDescriptor, ageSortDescriptor]];
        [sortedArray enumerateObjectsUsingBlock:^(People *people, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"name:%@, age:%ld", people.name, people.age);
        }];

        NSSortDescriptor *selectorSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO selector:@selector(compare:)];

        sortedArray = [peopleArry sortedArrayUsingDescriptors:@[selectorSortDescriptor]];
        [sortedArray enumerateObjectsUsingBlock:^(People *people, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"name:%@, age:%ld", people.name, people.age);
        }];

    }
    return 0;
}
