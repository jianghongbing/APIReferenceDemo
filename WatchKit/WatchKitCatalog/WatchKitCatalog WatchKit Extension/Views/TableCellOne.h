//
//  TableCell.h
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "SetLabelText.h"
@interface TableCellOne : NSObject <SetLabelText>
- (void)setLabelText:(NSString *)text;
@end

