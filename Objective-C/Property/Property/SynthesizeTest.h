//
//  SynthesizeTest.h
//  Property
//
//  Created by pantosoft on 2018/4/8.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynthesizeTest : NSObject
{
    NSString *_myName;
//    NSInteger _age;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
- (void)logInfo;
@end
