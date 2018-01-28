//
//  ContentGravityCell.m
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ContentGravityCell.h"
@interface ContentGravityCell()
@property (nonatomic, strong) CALayer *contentLayer;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation ContentGravityCell
NSString * const ContentGravityCellIdentifier = @"contentGravityCell";
#pragma mark getter
- (CALayer *)contentLayer {
    if (_contentLayer == nil) {
        _contentLayer = [CALayer layer];
        _contentLayer.backgroundColor = [UIColor orangeColor].CGColor;
        _contentLayer.contentsScale = [UIScreen mainScreen].scale;
        _contentLayer.contents = (id)([UIImage imageNamed:@"dog"].CGImage);
        [self.contentView.layer addSublayer:_contentLayer];
    }
    return _contentLayer;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentLayer.frame = CGRectMake(0, 0,self.bounds.size.width, 100);
    self.titleLabel.frame = CGRectMake(0, 100, self.bounds.size.width, self.bounds.size.height - 100);
}

@end
