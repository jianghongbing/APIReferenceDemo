//
//  TableInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableInterfaceController.h"
#import "TableCellOne.h"
#import "TableCellTwo.h"
@interface TableInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic) NSInteger totalRows;
@end
@implementation TableInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.totalRows = 10;
    [self configTable];
}

- (void)configTable {
    NSMutableArray *rowTypes = [NSMutableArray arrayWithCapacity:self.totalRows];
    for (int i = 0; i < self.totalRows; i++) {
        NSString *rowType = [self cellIdentiferAtRow:i];
        [rowTypes addObject:rowType];
    }
    
    [self.table setRowTypes:rowTypes];
    [self updateTable];
}


- (NSString *)cellIdentiferAtRow:(NSInteger)row {
    if (row < 0) return @"";
    return row % 2 == 0 ? @"cellOne" : @"cellTwo";
}

- (void)updateTable {
    for (int i = 0; i < self.totalRows; i++) {
        NSObject *object = [self.table rowControllerAtIndex:i];
        NSString *text = [NSString stringWithFormat:@"Row:%d", i];
        id<SetLabelText> cell = (id<SetLabelText>)object;
        [cell setLabelText:text];
    }
}


- (IBAction)insertRow {
    self.totalRows++;
    NSInteger insertRow = self.totalRows - 1;
    [self.table insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:insertRow] withRowType:[self cellIdentiferAtRow:insertRow]];
    [self updateTable];
}

- (IBAction)deleteRow {
    [self.table removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.totalRows - 1]];
    if (self.totalRows > 0) {
        self.totalRows--;
    }
    [self updateTable];
}
- (IBAction)scrollToTop {
    if (self.table.numberOfRows <= 0) return;
    [self.table scrollToRowAtIndex:0];
}
- (IBAction)scrollToBottom {
    if (self.table.numberOfRows <= 0) return;
    [self.table scrollToRowAtIndex:self.table.numberOfRows - 1];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    [table performSegueForRow:rowIndex];
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    return @{@"rowIndex": @(rowIndex)};
}

@end
