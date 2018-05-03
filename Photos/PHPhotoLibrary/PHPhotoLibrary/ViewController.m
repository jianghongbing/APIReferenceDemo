//
//  ViewController.m
//  PHPhotoLibrary
//
//  Created by jianghongbing on 2018/4/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
@interface ViewController ()<PHPhotoLibraryChangeObserver>
@property (weak, nonatomic) IBOutlet UILabel *authorizationStatusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //PHPhotoLibrary的作用:1.请求访问图片权限 2.执行操作,监听回调 3.为图片库添加观察者,当发生改变时,会通知观察者
    //1.获取用户访问图片的权限
    //PHAuthorizationStatusNotDetermined:用户还没有决定是否开放图片的权限给你,当为该权限时,app可以向用户发送请求授权访问
    //PHAuthorizationStatusRestricted:用户没有权限开放图片的访问权限给你
    //PHAuthorizationStatusAuthorized:用户已经允许app访问图片
    //PHAuthorizationStatusDenied:用户已经拒绝你访问图片
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    self.authorizationStatusLabel.numberOfLines = 0;
    self.authorizationStatusLabel.text = [self textForAuthorizationStatus:authorizationStatus];
    //6.注册photoLibraryChangeObserver:当图片库发生改变时,会通知该观察者
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
}
- (void)dealloc {
    //7.移除changeObserver
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}


- (IBAction)requestAuthorization:(id)sender {
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    if (authorizationStatus == PHAuthorizationStatusNotDetermined) {
        //2.向用户发起访问图片的权限的请求,在iOS7之后需要在plist文件中加上Privacy - Photo Library Usage Description
        //注意,block回调不是在主线程中,因此做UI的相关操作要回到主线程中
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            NSLog(@"callThread:%@", [NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.authorizationStatusLabel.text = [self textForAuthorizationStatus:status];
                if (status == PHAuthorizationStatusDenied) {
                    [self showAlert];
                }
            });

        }];
    }else if (authorizationStatus == PHAuthorizationStatusDenied) {
        [self showAlert];
    }
}
- (IBAction)saveImage:(id)sender {
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    if (authorizationStatus == PHAuthorizationStatusAuthorized) {
        [self saveRandomImage];
    }else if (authorizationStatus == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.authorizationStatusLabel.text = [self textForAuthorizationStatus:status];
                if (status == PHAuthorizationStatusAuthorized) {
                    [self saveRandomImage];
                }
            });
        }];
    }else if (authorizationStatus == PHAuthorizationStatusDenied) {
        [self showAlert];
    }
}

- (void)saveRandomImage {
    //3.PHPhotoLibrary是一个单例类
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    //4.异步执行某些改变,changeBlock:用于执行一些操作,如图片的添加,删除等,completionHanlder:操作执行完成后的回调
    [photoLibrary performChanges:^{
        UIImage *randomImage = [self randomImage];
        UIImageWriteToSavedPhotosAlbum(randomImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"completioHandlerThread:%@", [NSThread currentThread]);
        if (!error) {
            if (success) {
                NSLog(@"success");
            }
        }else {
            NSLog(@"error:%@", error);
        }
    }];
    //5.等待changeBlock完成,会阻塞当前线程,因此不要在主线程中调用该方法
//    [photoLibrary performChangesAndWait:^{
//
//    } error:nil];
}



- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"图片访问权限被拒绝" message:@"请到设置里面找到该app,开启授权" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSString *)textForAuthorizationStatus:(PHAuthorizationStatus)authorizationStatus {
    switch (authorizationStatus) {
        case PHAuthorizationStatusNotDetermined:
            return @"用户还没有确定你访问图片的权限,点击按钮发起请求";
        case PHAuthorizationStatusRestricted:
            return @"用户没有授权给你访问图片的权限";
        case PHAuthorizationStatusAuthorized:
            return @"用户已经允许你访问图片";
        case PHAuthorizationStatusDenied:
            return @"用户已经拒绝你访问图片";
    }
}


- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)randomImage {
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    CGFloat alpha = 1.0;
    UIImage *image = [self createImageWithColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha] size:CGSizeMake(100, 100)];
    return image;
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!error) {
        NSLog(@"save image success");
    }else {
        NSLog(@"save image error:%@", error);
    }
}

#pragma mark PHPhotoLibraryChangeObserver
- (void)photoLibraryDidChange:(PHChange *)changeInstance {
    NSLog(@"PHChange:%@", changeInstance);
}

@end
