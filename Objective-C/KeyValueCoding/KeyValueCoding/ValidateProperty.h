//
//  ValidateProperty.h
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/7.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidateProperty : NSObject
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                       score:(float)score;

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) float score;
@end
