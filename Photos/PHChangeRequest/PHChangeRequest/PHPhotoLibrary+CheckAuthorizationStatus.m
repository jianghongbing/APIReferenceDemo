//
//  PHPhotoLibrary+CheckAuthorizationStatus.m
//  PHChangeRequest
//
//  Created by jianghongbing on 2018/5/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PHPhotoLibrary+CheckAuthorizationStatus.h"

@implementation PHPhotoLibrary (CheckAuthorizationStatus)
+ (void)checkAuthorizationStatus:(void(^)(PHAuthorizationStatus status))completeHandler {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status != PHAuthorizationStatusNotDetermined) {
        if (completeHandler) {
            completeHandler(status);
        }
    }else {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completeHandler) {
                    completeHandler(status);
                }
            });
        }];
    }
}
@end
