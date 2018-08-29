//
//  SliderInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by pantosoft on 2018/8/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "SliderInterfaceController.h"
@interface SliderInterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSlider *slider1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSlider *slider2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label2;
@end
@implementation SliderInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self.slider1 setValue:0];
    [self.slider1 setColor:[UIColor orangeColor]];
    [self.slider1 setNumberOfSteps:10];
    [self.slider2 setEnabled:YES];
    [self.slider2 setNumberOfSteps:5];
}


- (IBAction)slider1ValueChanged:(float)value {
    [self.label1 setText:[NSString stringWithFormat:@"%.0f", value]];
}

- (IBAction)sliderValue2ValueChanged:(float)value {
    [self.label2 setText:[NSString stringWithFormat:@"%.0f", value]];
}
@end
