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

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setupInterfaceTable];
}

- (void)setupInterfaceTable {
    [self.interfaceTable setNumberOfRows:5 withRowType:@"interfaceTableCell"];
    for (int i = 0; i < 5; i++) {
        InterfaceTableCell *cell = [self.interfaceTable rowControllerAtIndex:i];
        [cell.label setText:@"WKLabel"];
    }
}


- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    [self pushControllerWithName:@"labelInterfaceController" context:nil];
}
@end



