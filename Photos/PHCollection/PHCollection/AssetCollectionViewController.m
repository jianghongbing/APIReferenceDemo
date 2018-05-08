//
//  AssetCollectionViewController.m
//  PHCollection
//
//  Created by jianghongbing on 2018/5/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "AssetCollectionViewController.h"
#import <Photos/Photos.h>
@interface AssetCollectionViewController ()
@property (nonatomic,strong) NSArray<PHFetchResult<PHAssetCollection *> *> *allAssetCollections;
@property (nonatomic,strong) NSArray<NSString *> *sectionTitles;
@end

@implementation AssetCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PHFetchResult *albumFetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    PHFetchResult *smartAlbumFetchReuslt = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    PHFetchResult *momentFetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeMoment subtype:PHAssetCollectionSubtypeAny options:nil];
    self.allAssetCollections = @[albumFetchResult, smartAlbumFetchReuslt, momentFetchResult];
    self.sectionTitles = @[@"相册", @"智能相册", @"记忆"];
    [self.tableView reloadData];
    self.tableView.tableFooterView = [UIView new];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.allAssetCollections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PHFetchResult *fetchResult = self.allAssetCollections[section];
    return fetchResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assetCollectionCell" forIndexPath:indexPath];
    PHFetchResult *fetchResult = self.allAssetCollections[indexPath.section];
    PHAssetCollection *collection = fetchResult[indexPath.row];
    cell.textLabel.text = collection.localizedTitle;
    PHFetchResult *assetFetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
    //获取fetchResult中某个类型的asset的数量
//    NSInteger assetCount = [fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage]
    cell.detailTextLabel.text = [NSString stringWithFormat:@"有%ld个asset", assetFetchResult.count];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //获取assetCollection的相关信息
    PHFetchResult *fetchResult = self.allAssetCollections[indexPath.section];
    PHAssetCollection *assetCollection = fetchResult[indexPath.row];
    PHAssetCollectionType type = assetCollection.assetCollectionType;
    PHAssetCollectionSubtype subType = assetCollection.assetCollectionSubtype;
    NSDate *startDate = assetCollection.startDate;
    NSDate *endDate = assetCollection.endDate;
    NSLog(@"type:%ld,subtype:%ld", type, subType);
    NSLog(@"startDate:%@, endDate:%@", startDate, endDate);
    //估计的asset的数量
    NSInteger estimatedAssetCount = assetCollection.estimatedAssetCount;
    //近似位置
    CLLocation *location = assetCollection.approximateLocation;
    NSLog(@"estimatedAssetCount:%ld, location:%@", estimatedAssetCount, location);
    //获取照片位置的名称
    [assetCollection.localizedLocationNames enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"name:%@", obj);
    }];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}

@end
