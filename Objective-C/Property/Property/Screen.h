//
//  Screen.h
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Screen : NSObject
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic) CGFloat height;
- (instancetype)initWithWidth:(CGFloat)width
                       height:(CGFloat)height;
- (void)display;
- (void)close;
@end
