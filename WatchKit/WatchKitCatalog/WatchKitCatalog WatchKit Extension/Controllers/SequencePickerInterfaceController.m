//
//  SequencePickerInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/9/19.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SequencePickerInterfaceController.h"
@interface SequencePickerInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *sequencePicker;

@end
@implementation SequencePickerInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configSequencePicker];
}

- (void)configSequencePicker {
    [self.sequencePicker setItems:@[[self pickerItemWithImageName:@"dog0"],
                                 [self pickerItemWithImageName:@"dog1"],
                                 [self pickerItemWithImageName:@"dog2"]]];
}

- (WKPickerItem *)pickerItemWithImageName:(NSString *)imageName {
    WKPickerItem *item = [[WKPickerItem alloc] init];
    WKImage *image = [WKImage imageWithImageName:imageName];
    item.contentImage = image;
    return item;
}
@end
