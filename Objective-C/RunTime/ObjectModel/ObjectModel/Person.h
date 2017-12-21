//
//  Person.h
//  ObjectModel
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@property (nonatomic, readonly) float height;
@property (nonatomic) float weight;
@property (nonatomic, copy) NSString *address;
- (void)eatting;
- (void)runAt:(NSString *)address;
+ (void)classTestMethod;
+ (NSString *)classTestMethod:(NSInteger)testInt;
@end
