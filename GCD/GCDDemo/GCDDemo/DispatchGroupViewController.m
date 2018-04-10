//
//  DispatchGroupViewController.m
//  GCDDemo
//
//  Created by pantosoft on 2018/4/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DispatchGroupViewController.h"


void notifyFunction(void *);


@interface DispatchGroupViewController ()

@end

@implementation DispatchGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //DispatchGroup:监视到添加到group的任务,一般用于对所有任务执行完成的监听,尽管这些任务在不同的queue中执行
    //    [self dispatchGroupNotify];
//    [self dispatchGroupWait];
    [self dispatchGroupEnterLeave];
}

- (void)dispatchGroupNotify {
    dispatch_group_t group = dispatch_group_create(); //创建dispatch_group
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jinaghongbing.concurrnetQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", DISPATCH_QUEUE_SERIAL);
    
    //往group中添加任务
    dispatch_group_async(group, mainQueue, ^{
        int i = 100;
        while (i != 0) {
            NSLog(@"i:%d, thread:%@", i, [NSThread currentThread]);
            i--;
        }
    });
    
    dispatch_group_async(group, globalQueue, ^{
        int m = 100;
        while (m != 0) {
            NSLog(@"m:%d, thread:%@", m, [NSThread currentThread]);
            m--;
        }
    });
    
    dispatch_group_async(group, concurrentQueue, ^{
        int n = 100;
        while (n != 0) {
            NSLog(@"n:%d, thread:%@", n, [NSThread currentThread]);
            n--;
        }
    });
    
    dispatch_group_async(group, serialQueue, ^{
        int q = 100;
        while (q != 0) {
            NSLog(@"q:%d, thread:%@", q, [NSThread currentThread]);
            q--;
        }
    });
    //监听group中的所有任务的完成
    //第一个参数:被监听的group,第二个参数:group中所有任务完成后回调的队列,第三个参数:回调的block,该block的回调一定发生在group中所有任务完成之后
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        int i = 10;
        while (i-- != 0) {
            NSLog(@"group中的任务都完成了"); //
        }
    });
    //    通过函数来进行回调
    //    dispatch_group_notify_f(group, concurrentQueue, NULL, notifyFunction);
    
}

- (void)dispatchGroupWait {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jinaghongbing.concurrnetQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_group_async(group, globalQueue, ^{
        int i = 100;
        while (i != 0) {
            NSLog(@"i:%d, thread:%@", i, [NSThread currentThread]);
            i--;
        }
    });
    
    dispatch_group_async(group, globalQueue, ^{
        int m = 100;
        while (m != 0) {
            NSLog(@"m:%d, thread:%@", m, [NSThread currentThread]);
            m--;
        }
    });
    NSLog(@"diaptch group not wait");
    
    dispatch_group_async(group, concurrentQueue, ^{
        int n = 100;
        while (n != 0) {
            NSLog(@"n:%d, thread:%@", n, [NSThread currentThread]);
            n--;
        }    });
    
    dispatch_group_async(group, concurrentQueue, ^{
        int q = 100;
        while (q != 0) {
            NSLog(@"q:%d, thread:%@", q, [NSThread currentThread]);
            q--;
        }
    });
    //dispatch_group_wait:等待group中的当前任务都执行完后,再执行后面的代码,会阻塞group所在的当前线程,常用该方法来做同步操作处理
    //第一个参数:需要等待的group,第二个参数:等待的时间,在指定的时间内返回,并执行后面的代码,如果传入的为dispatch_time_forever则需要等待group中当前的任务执行返回,否则会一直阻塞当前线程
    NSInteger result = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSInteger result = dispatch_group_wait(group, DISPATCH_TIME_NOW);
    //下面这行代码一定在上面的代码都执行完成后,在执行
    NSLog(@"dispatch group wait reuslt:%ld", result);
    dispatch_group_async(group, serialQueue, ^{
        int t = 100;
        while (t != 0) {
            NSLog(@"t:%d, thread:%@", t, [NSThread currentThread]);
            t--;
        }
    });
    
    dispatch_group_async(group, serialQueue, ^{
        int p = 100;
        while (p != 0) {
            NSLog(@"p:%d, thread:%@", p, [NSThread currentThread]);
            p--;
        }
    });
}


- (void)dispatchGroupEnterLeave {
    //dispatch_group_enter & dispatch_group_leave 这两个函数一般成对的出现,enter在前,leave在后
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group); //表示有一个block显示的添加到group中,而不是通过dispatch_group_async的方式来表示一个block被添加到group中
    [self performBlock:^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"i:%d, thread:%@", i, [NSThread currentThread]);
        }
        dispatch_group_leave(group);//表示一个group中的block执行完成
    }];
    
    dispatch_group_enter(group);
    [self performBlockOnBackground:^{
        int m = 100;
        while (m-- != 0) {
            NSLog(@"m:%d, thread:%@", m, [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [self performBlockOnBackground:^{
        int p = 100;
        while (p-- != 0) {
            NSLog(@"p:%d, thread:%@", p, [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"group中的任务都已经执行完成");
    });
    
//    long reuslt = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSLog(@"result:%ld block执行完成", reuslt);
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        int q = 100;
//        while (q-- != 0) {
//            NSLog(@"q:%d, thread:%@", q, [NSThread currentThread]);
//        }
//    });
    
}


- (void)performBlock:(void(^)(void))block {
    if(block) {
        block();
    }
}

- (void)performBlockOnBackground:(void(^)(void))block {
    if (block == nil) return;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        block();
    });
}



void notifyFunction(void *parameter) {
    int i = 10;
    while (i-- != 0) {
        NSLog(@"group中的任务都完成了,thread:%@", [NSThread currentThread]);
    }
}


@end
