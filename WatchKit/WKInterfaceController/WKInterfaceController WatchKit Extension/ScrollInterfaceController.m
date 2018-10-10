//
//  ScrollInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/10/10.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ScrollInterfaceController.h"
@interface ScrollInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button6;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *button7;

@end
@implementation ScrollInterfaceController

//通过点击状态栏,滚动到interface的顶部,该方法会被触发
- (void)interfaceDidScrollToTop {
    NSLog(@"interface did scroll to top");
}


//通过滚动手势,滚动到interface的顶部,该方法会被触发
- (void)interfaceOffsetDidScrollToTop {
    NSLog(@"interface offset did scroll to top");
}

//通过滚动手势,滚动到interface的底部,该方法会被触发
- (void)interfaceOffsetDidScrollToBottom {
    NSLog(@"interface offset did scroll to bottom");
}




- (IBAction)scrollToBottom {
    //滚动到某个视图的某个位置
    [self scrollToObject:self.button7 atScrollPosition:WKInterfaceScrollPositionBottom animated:YES];
}
- (IBAction)scrollToButton6 {
    [self scrollToObject:self.button6 atScrollPosition:WKInterfaceScrollPositionBottom animated:YES];
}
- (IBAction)scrollToButton2 {
    [self scrollToObject:self.button2 atScrollPosition:WKInterfaceScrollPositionCenteredVertically animated:YES];
}
- (IBAction)scrollToTop {
    [self scrollToObject:self.button1 atScrollPosition:WKInterfaceScrollPositionTop animated:YES];
}

@end
