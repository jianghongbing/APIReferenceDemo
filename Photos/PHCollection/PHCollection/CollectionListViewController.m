//
//  CollectionListViewController.m
//  PHCollection
//
//  Created by jianghongbing on 2018/5/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "CollectionListViewController.h"
#import <Photos/Photos.h>
@interface CollectionListViewController ()
//@property (nonatomic,strong)PHFetchResult<PHCollection *> *topLevelFetchResult;
//@property (nonatomic,strong) PHFetchResult<PHCollectionList *> *smartFolderResult;
//@property (nonatomic,strong) PHFetchResult<PHCollectionList *> *folderResult;
//@property (nonatomic,strong) PHFetchResult<PHCollectionList *> *momentListResult;
@property (nonatomic,strong) NSArray *allFetchResult;
@property (nonatomic,strong) NSArray *sectionTitles;
@end

@implementation CollectionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        [self loadDataFromPhotoLibrary];
    }else if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [self alert];
    }else if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized) {
                    [self loadDataFromPhotoLibrary];
                }else {
                    [self alert];
                }
            });
        }];
    }
}

- (void)loadDataFromPhotoLibrary {
    //获取PHAsset或者PHCollection的选项
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    //设置选项的predicate(相当于条件)
    fetchOptions.predicate = nil;
    //获取PHAsset或者PHCollection的集合的排序
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
    //是否包含隐藏的assets
    fetchOptions.includeHiddenAssets = YES;
    //是否包含所有连拍的assets
    fetchOptions.includeAllBurstAssets = YES;
    //获取数据的来源
    //用户库,云共享,iTunes同步
    fetchOptions.includeAssetSourceTypes = PHAssetSourceTypeUserLibrary | PHAssetSourceTypeCloudShared | PHAssetSourceTypeiTunesSynced;
    //获取数量的限制
    fetchOptions.fetchLimit = 0;
    //当Photos有发生变化时,是否发生Photos变化的消息给监听者,默认为YES
    fetchOptions.wantsIncrementalChangeDetails = YES;


    //获取用户自己在图库里面创建的文件夹
    PHFetchResult *topLevelFetchResult = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:fetchOptions];

    //获取记忆里面的文件件
    PHFetchResult *momentListResult = [PHCollectionList fetchCollectionListsWithType:PHCollectionListTypeMomentList subtype:PHCollectionListSubtypeAny options:nil];

    PHFetchResult *folderResult = [PHCollectionList fetchCollectionListsWithType:PHCollectionListTypeFolder subtype:PHCollectionListSubtypeAny options:nil];

    PHFetchResult *smartFolderResult = [PHCollectionList fetchCollectionListsWithType:PHCollectionListTypeSmartFolder subtype:PHCollectionListSubtypeAny options:nil];


    self.allFetchResult = @[topLevelFetchResult, momentListResult, folderResult, smartFolderResult];
    self.sectionTitles = @[@"用户创建的文件夹", @"记忆里面的文件夹", @"文件夹", @"智能文件夹"];
    [self.tableView reloadData];

    //通过assetCollectionType和assetCollectionSubtype来获取PHAssetCollection
//    fetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
//    NSLog(@"fetchResult:%@", fetchResult);



}

- (void)alert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"没有权限访问图库" message:@"请去设置里面开启图库访问权限" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.allFetchResult.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.topLevelFetchResult.count;
    PHFetchResult *fetchResult = self.allFetchResult[section];
    return fetchResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionListCell" forIndexPath:indexPath];
    PHFetchResult *fetchResult = self.allFetchResult[indexPath.section];
    PHCollection *collection = fetchResult[indexPath.row];
    cell.textLabel.text = collection.localizedTitle;
    if (collection.canContainAssets) { //判断文件夹中是否包含assets,如果包含则该对象类型为PHAssetsCollection
        //获取PHAssetCollection中的assets列表
        PHFetchResult *fetchAssets = [PHAsset fetchAssetsInAssetCollection:(PHAssetCollection *)collection options:nil];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"有%ld个assets", fetchAssets.count];;

    }else if (collection.canContainCollections) { //判断文件夹中是否包含collections,如果包含则该对象类型为PHCollectionList
        //获取PHCollectionList中的collection列表
        PHFetchResult<PHCollection *> *fetchCollections = [PHCollection fetchCollectionsInCollectionList:(PHCollectionList *)collection options:nil];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"有%ld个collection", fetchCollections.count];;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PHFetchResult *fetchResult = self.allFetchResult[indexPath.section];
    PHCollection *collection = fetchResult[indexPath.row];
//    NSString *localizedTitle = collection.localizedTitle; //获取本地化的标题
//    NSString *localIdentifier = collection.localIdentifier; //获取collection的id

    if ([collection canContainAssets]) {
        PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
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


    }else if ([collection canContainCollections]) {
        PHCollectionList *collectionList = (PHCollectionList *)collection;
        //获取collectionListType
        PHCollectionListType type = collectionList.collectionListType;
        //获取collectionListSubtype
        PHCollectionListSubtype subType = collectionList.collectionListSubtype;
        //获取collection中的所有asset中最早创建的那个日期
        NSDate *startDate = collectionList.startDate;
        //获取collection中的所有asset中最后修改的时间
        NSDate *endDate = collectionList.endDate;
        NSLog(@"type:%ld,subtype:%ld", type, subType);
        NSLog(@"startDate:%@, endDate:%@", startDate, endDate);

        //获取照片位置的名称
        [collectionList.localizedLocationNames enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"name:%@", obj);
        }];
    }
}

@end
