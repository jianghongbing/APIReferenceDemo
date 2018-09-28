//
//  InterfaceObjectController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/9/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "InterfaceObjectController.h"

@interface InterfaceObjectController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button3;
@property (nonatomic) CGFloat button3Width;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button4;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button5;
@property (nonatomic) BOOL changedRelativeWidthAndHeight;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button6;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *shortTextLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *longTextLabel;
@end

@implementation InterfaceObjectController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}
- (IBAction)showOrHiddenButton1 {
    [self.button1 setHidden:YES];
}
- (IBAction)changeButton2Alpha {
    [self.button1 setHidden:NO];
    [self.button2 setAlpha:arc4random_uniform(255) / 255.0];
}
- (IBAction)changeButtonWidthAndHeight {
    if (self.button3Width == 100) {
        [self.button3 setWidth:50];
        [self.button3 setHeight:30];
        self.button3Width = 50;
    }else {
        self.button3Width = 100;
        [self.button3 setWidth:100];
        [self.button3 setHeight:40];
    }
}
- (IBAction)changeButtonRelativeWidthAndHeight {
    if (self.changedRelativeWidthAndHeight) {
        [self.button4 setRelativeWidth:0.5 withAdjustment:10];
        [self.button5 setRelativeWidth:0.5 withAdjustment:10];
        [self.button4 setRelativeHeight:0.8 withAdjustment:1.0];
        self.changedRelativeWidthAndHeight = NO;
    }else {
        [self.button4 setRelativeHeight:1.0 withAdjustment:1.0];
        [self.button4 setRelativeWidth:0.25 withAdjustment:10];
        [self.button5 setRelativeWidth:0.75 withAdjustment:10];
        self.changedRelativeWidthAndHeight = YES;
    }
}
- (IBAction)changeAlignment {
    //设置自己在父容器中水平和垂直的对其方式
    [self.button6 setHorizontalAlignment:arc4random() % 3];
    [self.button6 setVerticalAlignment:arc4random() % 3];
}
- (IBAction)labelSizeToFit {
    //通过自己本身的内容自适应最合适的大小
    [self.shortTextLabel sizeToFitWidth];
    [self.shortTextLabel sizeToFitHeight];
    [self.longTextLabel sizeToFitWidth];
    [self.longTextLabel sizeToFitHeight];
}

@end



