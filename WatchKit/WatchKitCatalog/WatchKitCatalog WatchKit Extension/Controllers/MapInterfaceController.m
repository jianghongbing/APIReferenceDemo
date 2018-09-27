//
//  MapInterfaceController.m
//  WatchKitCatalog WatchKit Extension
//
//  Created by jianghongbing on 2018/9/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "MapInterfaceController.h"
#import <MapKit/MapKit.h>
@interface MapInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceMap *map;

@end

@implementation MapInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self configMap];
}

- (void)configMap {
    //1.设置map的可见范围
    [self.map setVisibleMapRect:MKMapRectWorld];
    //2.设置map特定的可见范围
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(30.52, 114.31);
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    [self.map setRegion:region];
    //3.add annatation
    [self.map addAnnotation:centerCoordinate withPinColor:WKInterfaceMapPinColorPurple];
    [self.map addAnnotation:centerCoordinate withImageNamed:@"test_icon" centerOffset:CGPointMake(30, 10)];
}


- (IBAction)removeAllAnnotation {
    [self.map removeAllAnnotations];
}
@end



