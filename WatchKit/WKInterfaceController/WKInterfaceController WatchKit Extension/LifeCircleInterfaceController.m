//
//  LifeCircleInterfaceController.m
//  WKInterfaceController WatchKit Extension
//
//  Created by pantosoft on 2018/10/10.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "LifeCircleInterfaceController.h"

@implementation LifeCircleInterfaceController

//1.在interface初始化的时候,会调用该方法,context用于上一个controller传递数据给该controller.通常在该方法中,为视图设置值和加载网络数据,该方法只会被调用一次
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSLog(@"func:%s,cotext:%@", __func__, context);
}

//2.controller激活的时候,会调用该方法,但是该方法不能保证controrller已经出现在屏幕上,会被调用多次
- (void)willActivate {
    NSLog(@"func:%s", __func__);
}

//3.controller的内容已经出现在屏幕上,会调用该方法,可以在该方法中,通常将动画的执行放在该方法中,会被调用多次
- (void)didAppear {
    NSLog(@"func:%s", __func__);
}

//4.controller消失于屏幕上的时候,会调用该方法,会被调用多次,通常在该该方法中停止动画的执行
- (void)willDisappear {
    NSLog(@"func:%s", __func__);
}
//5.controller无效的时候会调用该方法,通常在该方法中,做一些清理操作
- (void)didDeactivate {
    NSLog(@"func:%s", __func__);

}




@end
