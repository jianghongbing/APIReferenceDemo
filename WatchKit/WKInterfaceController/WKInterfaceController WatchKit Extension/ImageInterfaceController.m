//
//  ImageViewController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/9/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ImageInterfaceController.h"
NSString * const ImageInterfaceControllerId = @"imageInterfaceController";
@interface ImageInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *interfaceImage;

@end
@implementation ImageInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString *imageName = context[@"imageName"];
    [self.interfaceImage setImageNamed:imageName];
    if ([imageName isEqualToString:@"dog1"]) {
        [self becomeCurrentPage];
    }
}
@end
