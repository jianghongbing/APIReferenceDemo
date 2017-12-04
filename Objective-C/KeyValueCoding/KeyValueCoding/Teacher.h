//
//  Teacher.h
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
- (instancetype)initWithName:(NSString *)name className:(NSString *)className;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *className;
@end
