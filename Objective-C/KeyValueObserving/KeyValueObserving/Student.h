//
//  Student.h
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
- (instancetype)initWithName:(NSString *)name;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) float chineseScore;
@property (nonatomic) float mathScore;
@property (nonatomic) float englishScore;
@property (nonatomic, readonly) float totalScore;
- (void)changeChineseScore:(float)chineseScore;
@end
