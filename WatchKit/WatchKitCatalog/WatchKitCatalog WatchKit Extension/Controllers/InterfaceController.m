//
//  InterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/13.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "InterfaceController.h"
#import "LabelInterfaceController.h"
#import "InterfaceTableCell.h"
@interface InterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *interfaceTable;
@property (nonatomic,strong) NSArray *dataSource;
@end
static NSString * const kItemNameKey = @"itemName";
static NSString * const kControllerNameKey = @"controllerName";


@implementation InterfaceController
#pragma mark
//- (NSArray *)dataSource {
//    if (_dataSource == nil) {
//        _dataSource = @[
//        @{kClassNameKey: @"WKInterfaceLabel",
//          kControllerNameKey:@"labelInterfaceController"},
//        @{kClassNameKey: @"WKInterfaceTimer",
//          kControllerNameKey: @"timerInterfaceController"},
//        ];
//    }
//    return _dataSource;
//}


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configData];
    [self setupInterfaceTable];
}

- (void)configData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    self.dataSource = [[NSArray alloc] initWithContentsOfFile:path];

}

- (void)setupInterfaceTable {
    [self.interfaceTable setNumberOfRows:self.dataSource.count withRowType:@"interfaceTableCell"];
    for (int i = 0; i < self.dataSource.count; i++) {
        InterfaceTableCell *cell = [self.interfaceTable rowControllerAtIndex:i];
        NSDictionary *dictionary = self.dataSource[i];
        [cell.label setText:dictionary[kItemNameKey]];
    }
}


- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    NSDictionary *dictionary = self.dataSource[rowIndex];
    NSString *controllerName = dictionary[kControllerNameKey];
    [self pushControllerWithName:controllerName context:nil];
}
@end



