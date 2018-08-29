//
//  PickerInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "PickerInterfaceController.h"
@interface PickerInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *picker1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *picker2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *picker3;
@end
@implementation PickerInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configPicker1];
}

- (void)configPicker1 {
    WKPickerItem *itemA = [self itemWithTitle:@"A" caption:@"a" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemB = [self itemWithTitle:@"B" caption:@"b" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemC = [self itemWithTitle:@"C" caption:@"c" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemD = [self itemWithTitle:@"D" caption:@"d" accessoryImage:nil contentImage:nil];
    [self.picker1 setItems:@[itemA, itemB, itemC, itemD]];
    [self.picker1 setSelectedItemIndex:2];
}

- (WKPickerItem *)itemWithTitle:(NSString *)title
                        caption:(NSString *)caption
                 accessoryImage:(WKImage *)accessoryImage
                   contentImage:(WKImage *)contentImage {
    WKPickerItem *pickerItem = [[WKPickerItem alloc] init];
    pickerItem.title = title;
    pickerItem.caption = caption;
    pickerItem.accessoryImage = accessoryImage;
    pickerItem.contentImage = contentImage;
    return pickerItem;
}
@end
