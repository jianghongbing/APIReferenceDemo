//
//  StackPickerInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/30.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "StackPickerInterfaceController.h"
@interface StackPickerInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *stackPicker;
@end
@implementation StackPickerInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configStackPicker];
}

- (void)configStackPicker {
    [self.stackPicker setItems:@[[self pickerItemWithImageName:@"dog0"],
                                 [self pickerItemWithImageName:@"dog1"],
                                 [self pickerItemWithImageName:@"dog2"]]];
}

- (WKPickerItem *)pickerItemWithImageName:(NSString *)imageName {
    WKPickerItem *item = [[WKPickerItem alloc] init];
    WKImage *image = [WKImage imageWithImageName:imageName];
    item.contentImage = image;
    return item;
}
- (IBAction)didSelectIndex:(NSInteger)index {
    
}

@end
