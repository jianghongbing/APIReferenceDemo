//
//  ViewController.m
//  NSTextAttachment
//
//  Created by pantosoft on 2019/5/21.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    CGSize imageSize = CGSizeMake(40, 40);
    textAttachment.image = [self createImageWithSize:imageSize];
    textAttachment.bounds = (CGRect){CGPointZero, imageSize};
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"hello, world"];
    [attributeString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, 5)];
    [attributeString insertAttributedString:attachmentString atIndex:7];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 0, 0)];
    label.attributedText = attributeString.copy;
    label.backgroundColor = [UIColor orangeColor];
    [label sizeToFit];
    [self.view addSubview:label];
}

- (UIImage *)createImageWithSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *strokeColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
    UIColor *fillColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
    CGContextSetLineWidth(context, 2.0);
    [strokeColor setStroke];
    [fillColor setFill];
    CGRect rect = (CGRect){CGPointZero, size};
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
