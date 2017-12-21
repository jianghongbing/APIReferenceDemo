//
//  Animal.h
//  iVarAndProperty
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    NSString *_name;
    NSInteger _age;
}
@property (nonatomic) float weight;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age weight:(float)weight;
@end
