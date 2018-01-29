//
//  DrawLayer.h
//  CALayer
//
//  Created by pantosoft on 2018/1/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface DrawLayer : CALayer
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;
@end
