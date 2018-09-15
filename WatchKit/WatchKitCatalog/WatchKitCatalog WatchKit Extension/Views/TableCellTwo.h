//
//  TableCellTwo.h
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "SetLabelText.h"
@interface TableCellTwo : NSObject <SetLabelText>
- (void)setLabelText:(NSString *)text;
@end
