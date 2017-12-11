//
//  Person.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "Person.h"

void * balanceContext = &balanceContext;
@interface Person()
@property (nonatomic) NSInteger count;
@end
@implementation Person
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name.copy;
    }
    return self;
}

#pragma mark KVO的实现
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == balanceContext) {
        self.count++;
        NSLog(@"self.count:%ld", self.count);
        NSLog(@"keyPath:%@,object:%@,change:%@", keyPath, object, change);
        
        //1.获取对应各个key的值
        id oldValue = change[NSKeyValueChangeOldKey];
        id newValue = change[NSKeyValueChangeNewKey];
        id kindValue = change[NSKeyValueChangeKindKey];
        id notificationIsPrior = change[NSKeyValueChangeNotificationIsPriorKey];
        NSLog(@"old:%@,new:%@,kind:%@,isPrior:%@", oldValue, newValue, kindValue, notificationIsPrior);
    }
}

//- (void)dealloc {
//    [self removeObserver:<#(nonnull NSObject *)#> forKeyPath:(nonnull NSString *) context:<#(nullable void *)#>]
//}
@end
