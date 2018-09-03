//
//  TableInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/9/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableInterfaceController.h"
@interface TableInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;

@end
@implementation TableInterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configTable];
}

- (void)configTable {
    
}


- (IBAction)insertRow {
}
- (IBAction)deleteRow {
}
- (IBAction)scrollToTop {
}
- (IBAction)scrollToBottom {
}
@end
