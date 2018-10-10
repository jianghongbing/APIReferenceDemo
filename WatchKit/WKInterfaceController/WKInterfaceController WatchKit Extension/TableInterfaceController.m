//
//  TableInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/10/10.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableInterfaceController.h"

@interface TableRow: NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end

@implementation TableRow
@end


@interface TableInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;

@end
@implementation TableInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setupTable];
}

- (void)setupTable {
    NSInteger rowCount = 10;
    [self.table setNumberOfRows:rowCount withRowType:@"tableRow"];
    for (int i = 0; i < rowCount; i++) {
        TableRow *row = [self.table rowControllerAtIndex:i];
        [row.label setText:[NSString stringWithFormat:@"%d", i]];
    }
}

//当点击了interfaceController的table的某一行,回调该方法
- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    NSString *message = [NSString stringWithFormat:@"点击了第%d行", rowIndex];
    WKAlertAction *action = [WKAlertAction actionWithTitle:@"确定" style:WKAlertActionStyleCancel handler:^{
        
    }];
    [self presentAlertControllerWithTitle:nil message:message preferredStyle:WKAlertControllerStyleAlert actions:@[action]];
}


@end
