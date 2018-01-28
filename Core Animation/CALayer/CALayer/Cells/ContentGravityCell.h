//
//  ContentGravityCell.h
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXTERN NSString * const ContentGravityCellIdentifier;
@interface ContentGravityCell : UICollectionViewCell
@property (nonatomic, strong, readonly) CALayer *contentLayer;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@end
