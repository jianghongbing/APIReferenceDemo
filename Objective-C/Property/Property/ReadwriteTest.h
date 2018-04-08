//
//  ReadwriteTest.h
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadwriteTest : NSObject
- (instancetype)initWithName:(NSString *)name identifier:(NSString *)identifier;
@property (nonatomic, copy, setter = setMyName:) NSString *name;
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, getter = isValid) BOOL valid;
@end
