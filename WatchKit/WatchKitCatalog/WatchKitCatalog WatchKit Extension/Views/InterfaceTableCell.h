//
//  InterfaceTableCell.h
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/8/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
@interface InterfaceTableCell : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@end
