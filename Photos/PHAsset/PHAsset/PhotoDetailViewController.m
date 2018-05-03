//
//  PhotoDetailViewController.m
//  PHAsset
//
//  Created by jianghongbing on 2018/4/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import <Photos/Photos.h>
@interface PhotoDetailViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedImageView:)];
    [self.imageView addGestureRecognizer:gestureRecognizer];
    [self logAssetInfo];
    self.progressView.hidden = YES;
    PHImageManager *imageManager = [PHImageManager  defaultManager];
    PHImageRequestOptions *imageRequestOptions = [[PHImageRequestOptions alloc] init];
    imageRequestOptions.progressHandler = ^(double progress, NSError * error, BOOL * stop, NSDictionary *info) {
//        NSLog(@"info:%@,progress:%f", info, progress);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                if (progress <= 1.0) {
                    self.progressView.hidden = NO;
                    [self.progressView setProgress:progress animated:YES];
                    if (progress == 1.0) {
                        self.progressView.hidden = YES;
                    }
                }
            }else {
                *stop = YES;
                NSLog(@"error:%@", error);
            }
        });

    };
    imageRequestOptions.networkAccessAllowed = YES;
    [imageManager requestImageForAsset:self.asset targetSize:self.view.bounds.size contentMode:PHImageContentModeAspectFill options:imageRequestOptions resultHandler:^(UIImage *image, NSDictionary *info) {
        self.imageView.image = image;
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)logAssetInfo {
    PHAsset *asset = self.asset;
    //1.PHAsset的播放形式
    PHAssetPlaybackStyle playbackStyle = asset.playbackStyle;
    //2.asset的媒体类型,如果视屏,还是图片,还是音频
    PHAssetMediaType mediaType = asset.mediaType;
    //3.asset的子媒体类型
    PHAssetMediaSubtype mediaSubType = asset.mediaSubtypes;
    NSLog(@"playbackStyle:%ld, mediaType:%ld,mediaSubType:%ld", playbackStyle, mediaType, mediaSubType);
    //4.asset的宽度,以像素为单位
    NSUInteger pixelWidth = asset.pixelWidth;
    //5.asset的高度,以像素为单位
    NSUInteger pixexHeight = asset.pixelHeight;
    //6.asset的创建日期
    NSDate *createDate = asset.creationDate;
    //7.asset最后修改的日期
    NSDate *modificationDate = asset.modificationDate;
    NSLog(@"width:%zd,height:%zd,createDate:%@,modificationDate:%@", pixelWidth, pixexHeight, createDate, modificationDate);
    //8.拍照或者录制视频的位置
    CLLocation *location = asset.location;
    //9.视频的时长,如果mediaType为图片,值为0
    CGFloat duration = asset.duration;
    //10.是否隐藏
    BOOL isHidden = asset.isHidden;
    //11.是否将该asset设置为喜爱状态
    BOOL isFavorite = asset.isFavorite;
    NSLog(@"location:%@, duration:%f,isHidden:%d,isFavorite:%d", location, duration, isHidden, isFavorite);
    //12.连拍模式id(iPhone长按拍照按钮实现连拍)
    NSString *burstIdentifier = asset.burstIdentifier;
    //13.连拍模式类型
    PHAssetBurstSelectionType burstSelectionTypes = asset.burstSelectionTypes;
    //14.该asset是否是某个连拍的图片集合的代表
    BOOL representsBurst = asset.representsBurst;
    NSLog(@"burstIdentifier:%@,burstSelectionTypes:%ld,representBursent:%d", burstIdentifier, burstSelectionTypes, representsBurst);
    //15.asset的来源,常见的有图片库,iCould,通过itunes同步过来的asset
    PHAssetSourceType sourceType = asset.sourceType;
    //16.是否可以执行某个编辑操作
    //PHAssetEditOperationDelete 删除操作
    //PHAssetEditOperationContent 编辑内容操作
    //PHAssetEditOperationProperties 修改属性操作
    BOOL canPerformEditOperation = [asset canPerformEditOperation:PHAssetEditOperationDelete];
    NSLog(@"sourceType:%ld,canPerformEditOperation:%d", sourceType, canPerformEditOperation);

}

- (void)tappedImageView:(UITapGestureRecognizer *)gestureRecognizer {
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}

@end
