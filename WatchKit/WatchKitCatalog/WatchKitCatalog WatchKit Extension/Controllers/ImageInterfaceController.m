//
//  ImageInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/9/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ImageInterfaceController.h"

@interface ImageInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *interfaceImage1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *interfaceImage2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *interfaceImage3;

@end

@implementation ImageInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configInterfaceImage1];
    [self configInterfaceImage2];
    [self configInterfaceImage3];
}

- (void)configInterfaceImage1 {
    [self.interfaceImage1 setImageNamed:@"dog1"];
}

- (void)configInterfaceImage2 {
    [self.interfaceImage2 setTintColor:[UIColor redColor]];
    [self.interfaceImage2 setImageNamed:@"cat60x60"];
}

- (void)configInterfaceImage3 {
    [self.interfaceImage3 setImageNamed:@"dog"];
}

- (IBAction)startAnimation {
    [self.interfaceImage3 startAnimatingWithImagesInRange:NSMakeRange(0, 2) duration:1.0 repeatCount:10];
//    [self.interfaceImage3 startAnimating];
}
- (IBAction)stopAnimation {
    [self.interfaceImage3 stopAnimating];
}

@end



