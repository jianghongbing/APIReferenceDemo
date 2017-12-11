//
//  Student.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Student.h"
@interface Student()
@property (nonatomic, copy) NSString *name;
@end
@implementation Student
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name.copy;
    }
    return self;
}


- (void)changeChineseScore:(float)chineseScore {
    _chineseScore = chineseScore;
}


//手动KVO通知的实现
- (void)setEnglishScore:(float)englishScore {
    if (_englishScore == englishScore) return;
    [self willChangeValueForKey:@"englishScore"];
    _englishScore = englishScore;
    [self didChangeValueForKey:@"englishScore"];
}
//是否允许发送通知给观察者
//下面的实现和两个已经注释的实现的功能一样
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"mathScore"] || [key isEqualToString:@"englishScore"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

//+ (BOOL)automaticallyNotifiesObserversOfMathScore {
//    return NO;
//}
//+ (BOOL)automaticallyNotifiesObserversOfEnglishScore {
//    return NO;
//}
@end
