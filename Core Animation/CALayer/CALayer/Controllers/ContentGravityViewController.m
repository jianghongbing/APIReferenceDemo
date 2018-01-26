//
//  ContentGravityViewController.m
//  CALayer
//
//  Created by pantosoft on 2018/1/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ContentGravityViewController.h"
#import "ContentGravityCell.h"
@interface ContentGravityViewController () <UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ContentGravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[kCAGravityCenter, kCAGravityTop, kCAGravityBottom, kCAGravityLeft, kCAGravityRight, kCAGravityTopLeft, kCAGravityTopRight, kCAGravityBottomLeft, kCAGravityBottomRight, kCAGravityResize, kCAGravityResizeAspect, kCAGravityResizeAspectFill];
    
}


#pragma mark UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ContentGravityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ContentGravityCellIdentifier forIndexPath:indexPath];
    NSString *contentGravity = self.datas[indexPath.item];
    cell.contentLayer.contentsGravity = contentGravity;
    cell.titleLabel.text = contentGravity;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 120);
}
@end
