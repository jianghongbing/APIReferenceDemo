//
//  PHPhotoLibrary+CheckAuthorizationStatus.h
//  PHChangeRequest
//
//  Created by jianghongbing on 2018/5/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Photos/Photos.h>

@interface PHPhotoLibrary (CheckAuthorizationStatus)
+ (void)checkAuthorizationStatus:(void(^)(PHAuthorizationStatus status))completeHandler;
@end
