//
//  PhotosCollectionViewController.m
//  PHAsset
//
//  Created by jianghongbing on 2018/4/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import <Photos/Photos.h>
#import "PhotoDetailViewController.h"
@interface UIViewController (Alert)
+ (NSString *)messageForStatus:(PHAuthorizationStatus)status;
- (void)alertWithStatus:(PHAuthorizationStatus)status;
@end

@implementation UIViewController (Alert)
+ (NSString *)messageForStatus:(PHAuthorizationStatus)status {
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
            return @"用户还没有确定app访问图片的权限,点击右上角按钮请求权限";
        case PHAuthorizationStatusRestricted:
            return @"用户没有搜权app访问图片的权限";
        case PHAuthorizationStatusDenied:
            return @"用户拒绝app访问图片";
        case PHAuthorizationStatusAuthorized:
            return @"app已经可以访问图片,点击左上角上角按钮加载图片";
        default:
            break;
    }
}

- (void)alertWithStatus:(PHAuthorizationStatus)status {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"图片访问权限" message:[UIViewController messageForStatus:status] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end


@interface PhotosCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) PHFetchResult<PHAsset *> *allPhotos;
@end

@implementation PhotosCollectionViewController

static NSString * const cellReuseIdentifier = @"imageCell";
static NSString * const headerViewReuseIdentifier = @"headerView";

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)requestPhotoLibraryAccess:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self alertWithStatus:status];
                [self.collectionView reloadData];
            });
        }];
    }else {
        [self alertWithStatus:status];
    }
}

- (IBAction)loadAllPhotos:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status != PHAuthorizationStatusAuthorized) {
        [self alertWithStatus:status];
        return;
    }
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES];
    fetchOptions.sortDescriptors = @[sortDescriptor];
    fetchOptions.includeAssetSourceTypes = PHAssetSourceTypeUserLibrary;
    //获取asset
//    self.allPhotos = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
    self.allPhotos = [PHAsset fetchAssetsWithOptions:fetchOptions];
    [self.collectionView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PhotoDetailViewController *detail = segue.destinationViewController;
    UICollectionViewCell *cell = (UICollectionViewCell *)sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    PHAsset *asset = self.allPhotos[indexPath.item];
    detail.asset = asset;
}



#pragma mark UICollectionViewDataSource && Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allPhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    PHImageManager *imageManager = [PHImageManager  defaultManager];
    PHAsset *asset = self.allPhotos[indexPath.item];
    UIImageView *imageView = [cell viewWithTag:100];
    [imageManager requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage *image, NSDictionary *info) {
        imageView.image = image;
    }];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewReuseIdentifier forIndexPath:indexPath];
    UILabel *label = [headerView viewWithTag:100];
    label.text = [UIViewController messageForStatus:[PHPhotoLibrary authorizationStatus]];
    return headerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds), 50);
}

@end
