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
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (nonatomic, strong) NSArray<NSString *> *picker1Titles;
@property (nonatomic, strong) NSArray<NSString *> *picker2Titles;
@property (nonatomic) NSInteger picker1Index;
@property (nonatomic) NSInteger picker2Index;
@end
@implementation PickerInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.picker1Titles = @[@"上午",@"中午", @"下午", @"晚上"];
    self.picker2Titles = @[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"];
    self.picker1Index = 2;
    self.picker2Index = 0;
    [self configPicker1];
    [self configPicker2];
    [self updateLabelText:2 picker2SeletedIndex:0];
}

- (void)configPicker1 {
    WKPickerItem *itemA = [self itemWithTitle:@"上午" caption:@"a" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemB = [self itemWithTitle:@"中午" caption:@"b" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemC = [self itemWithTitle:@"下午" caption:@"c" accessoryImage:nil contentImage:nil];
    WKPickerItem *itemD = [self itemWithTitle:@"晚上" caption:@"d" accessoryImage:nil contentImage:nil];
    [self.picker1 setSelectedItemIndex:2];
    [self.picker1 setItems:@[itemA, itemB, itemC, itemD]];
}

- (void)configPicker2 {
    WKPickerItem *item1 = [self itemWithTitle:@"周一" caption:@"1" accessoryImage:nil contentImage:nil];
    WKPickerItem *item2 = [self itemWithTitle:@"周二" caption:@"2" accessoryImage:nil contentImage:nil];
    WKPickerItem *item3 = [self itemWithTitle:@"周三" caption:@"3" accessoryImage:nil contentImage:nil];
    WKPickerItem *item4 = [self itemWithTitle:@"周四" caption:@"4" accessoryImage:nil contentImage:nil];
    WKPickerItem *item5 = [self itemWithTitle:@"周五" caption:@"5" accessoryImage:nil contentImage:nil];
    WKPickerItem *item6 = [self itemWithTitle:@"周六" caption:@"6" accessoryImage:nil contentImage:nil];
    WKPickerItem *item7 = [self itemWithTitle:@"周日" caption:@"7" accessoryImage:nil contentImage:nil];

    [self.picker2 setItems:@[item1, item2, item3, item4, item5, item6, item7]];
    [self.picker2 setSelectedItemIndex:0];
    [self.picker2 focus]; //成为焦点
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
- (IBAction)pikcer1DidSelectIndex:(NSInteger)index {
    self.picker1Index = index;
    [self updateLabelText:index picker2SeletedIndex:self.picker2Index];
    if (index == self.picker1Titles.count - 1) {
        [self.picker1 resignFocus];
        [self.picker2 focus];
    }
    
}
- (IBAction)picker2DidSelectIndex:(NSInteger)index {
    self.picker2Index = index;
    [self updateLabelText:self.picker1Index picker2SeletedIndex:index];
    if (index == self.picker2Titles.count - 1) {
        [self.picker2 resignFocus];
        [self.picker1 focus];
    }
}
- (void)updateLabelText:(NSInteger)picker1SelectedIndex picker2SeletedIndex:(NSInteger)picker2SelectedIndex {
    if (picker1SelectedIndex < 0 || picker1SelectedIndex > self.picker1Titles.count - 1 || picker2SelectedIndex < 0 || picker2SelectedIndex > self.picker2Titles.count - 1) return;
    NSString *picker1SelectedItemTitle = self.picker1Titles[picker1SelectedIndex];
    NSString *picker2SelectedItemTItle = self.picker2Titles[picker2SelectedIndex];
    [self.label setText:[NSString stringWithFormat:@"%@-%@", picker1SelectedItemTitle, picker2SelectedItemTItle]];

}
@end


