//
//  TableCell.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableCellOne.h"
@interface TableCellOne ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end
@implementation TableCellOne
- (void)setLabelText:(NSString *)text {
    [self.label setText: text];
}
@end
