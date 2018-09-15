//
//  TableCellTwo.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableCellTwo.h"
@interface TableCellTwo ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end
@implementation TableCellTwo
- (void)setLabelText:(NSString *)text {
    [self.label setText: text];
}
@end
