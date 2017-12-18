//
//  Student.h
//  RunTimeTestDemo
//
//  Created by pantosoft on 2017/12/18.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSInteger _age;
    NSString *_name;
}
@property (nonatomic) float score;
- (void)foo;
@end
