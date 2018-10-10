//
//  InterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by jianghongbing on 2018/8/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "InterfaceController.h"
#import "PushedAInterfaceController.h"
#import "PresentAInterfaceController.h"
#import "ImageInterfaceController.h"
#import "ReloadInterfaceController.h"
static NSString * const kPushSegueId = @"pushSegue";
static NSString * const kPresentSegueId = @"presentSegue";
static NSString * const kLifeCircleSegueId = @"lifeCircleSegue";
@interface InterfaceController ()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setTitle:@"InterfaceController"];
}


//1. push controller
- (IBAction)pushAViewController {
    /**
     * push controller
     * name: controller的id
     * context: 作为参数传给将要被push的controller,一般通过dictionary来传递参数
     */
    [self pushControllerWithName:PushedAInterfaceControllerId context:@{@"userId": @"0001"}];
}


//2. present controller
- (IBAction)presentAViewController {
    [self presentControllerWithName:PresentAInterfaceControllerId context:@{@"userId": @"0002"}];
}

//3.preset controller page based
- (IBAction)presentImageViewControllers {
    [self presentControllerWithNames:@[ImageInterfaceControllerId, ImageInterfaceControllerId, ImageInterfaceControllerId] contexts:@[@{@"imageName": @"dog0"}, @{@"imageName": @"dog1"}, @{@"imageName": @"dog2"}]];
    
    
}

//4. alert
- (IBAction)alert {
    [self alertWithStyle:WKAlertControllerStyleAlert];
}

- (IBAction)alertSideBySideButtons {
    [self alertWithStyle:WKAlertControllerStyleSideBySideButtonsAlert];
}

- (IBAction)alertActionSheet {
    [self alertWithStyle:WKAlertControllerStyleActionSheet];
}


- (void)alertWithStyle:(WKAlertControllerStyle)style{
    
    WKAlertAction *okAction = [WKAlertAction actionWithTitle:@"ok" style:WKAlertActionStyleDefault handler:^{
        NSLog(@"excute ok action");
    }];
    
    WKAlertAction *cancelAction = [WKAlertAction actionWithTitle:@"cancel" style:WKAlertActionStyleCancel handler:^{
        NSLog(@"excute cancel action");
    }];
    
    WKAlertAction *deleteAction = [WKAlertAction actionWithTitle:@"delete" style:WKAlertActionStyleDestructive handler:^{
        NSLog(@"excute delete action");
    }];
    NSString *title;
    NSString *message;
    NSArray *actions = @[okAction, cancelAction, deleteAction];
    switch (style) {
        case WKAlertControllerStyleAlert:
        {
            title = @"Alert";
            message = @"an Alert";
        }
            break;
        case WKAlertControllerStyleSideBySideButtonsAlert:
        {
            title = @"Side by Side";
            message = @"alert side by side";
            actions = @[okAction, cancelAction];
        }
            break;
        case WKAlertControllerStyleActionSheet:
        {
            title = @"Action Sheet";
            message = @"an action sheet";
        }
            break;
            
        default:
            break;
    }
    [self presentAlertControllerWithTitle:title message:message preferredStyle:style actions:actions];
}

//5. reload Root Contollers
- (IBAction)reloadRootControllers {
    [WKInterfaceController reloadRootPageControllersWithNames:@[ReloadInterfaceControllerId, ReloadInterfaceControllerId, ReloadInterfaceControllerId, ReloadInterfaceControllerId] contexts:@[@{@"letter": @"A"}, @{@"letter": @"B"}, @{@"letter": @"C"}, @{@"letter": @"D"}] orientation:WKPageOrientationHorizontal  pageIndex:3];
}


//3.通过segue来传递参数
- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier {
    if ([segueIdentifier isEqualToString:kPushSegueId]) {
        return @{@"userName": @"abc"};
    }else if ([segueIdentifier isEqualToString:kPresentSegueId]) {
        return @{@"userName": @"def"};
    }else if([segueIdentifier isEqualToString:kLifeCircleSegueId]) {
        return @{@"userName": @"jiang"};
    }
    return nil;
}


//- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
//    NSLog(@"index:%ld", rowIndex);
//}
@end



