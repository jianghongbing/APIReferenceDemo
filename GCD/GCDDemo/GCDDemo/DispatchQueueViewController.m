//
//  DispatchQueueViewController.m
//  GCDDemo
//
//  Created by pantosoft on 2018/3/14.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DispatchQueueViewController.h"

static void * serialContext;
static void * concurrentContext;


//void serialTaskFunction(void * context);
//void concurrentTaskFunction(void * context);
void excuteAsyncTaskByFunction(void * context);
void excuteSyncTaskByFunction(void * context);


@implementation DispatchQueueViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //DispatchQueue:派发队列,队列中的任务以FIFO的方式执行,在Objective-C中,队列分两种,串行队列和并行队列
    //串行队列,每次只能一个任务,后添加进来的任务需要等前面的任务执行完才能执行
    //并行队列,可以同时执行多个任务,无需等到之前的任务结束,具体可以同时执行多少人任务,有系统以及cpu来调度
    
    
    
    //获取队列的方式
    //1.主线程队列,串行队里,有且仅有一个主队列,在app开始的时候就创建,一直到app结束才销毁,伴随整个app的周期
//    dispatch_queue_t mianQueue = dispatch_get_main_queue();
    //2.获取全局队列,系统提供的全局队列,并发队列,第一个参数是队列的优先级,第二个参数设置为0
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //3.创建串行队列,第一个参数为队列的名称,方便于调试,第二个参数为队列的类型
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", DISPATCH_QUEUE_SERIAL);
    //4.创建并行队列
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jianghongbing.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    [self getQueueInfo];
    //队列执行任务的方式
    //异步执行:异步执行,多个任务同时执行
    //同步执行:同步执行,一次只能执行一个任务,并且需要等其他任务执行完成,会产生死锁的情况
//    [self asyncExcuteTask];
//    [self syncExcuteTask];
//    [self mainQueueTest];
//    [self globalQueueTest];
//    [self serialQueueTest];
//    [self concurrentQueueTest];
    //在MRC的时代,需要释放创建的Dipatch Object
//    dispatch_release(serialQueue);
//    dispatch_release(concurrentQueue);

}

//获取queue的相关信息
- (void)getQueueInfo {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    int queuePriority = 0;
    //获取队列名称
    const char *queueName = dispatch_queue_get_label(mainQueue);
    //获取qos_name,以及相关的优先级
    dispatch_queue_priority_t qos_class = dispatch_queue_get_qos_class(mainQueue, &queuePriority);
    NSLog(@"queueName:%s,qos_class:%ld queuePriority:%d", queueName, qos_class, queuePriority);
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    queueName = dispatch_queue_get_label(globalQueue);
    qos_class = dispatch_queue_get_qos_class(globalQueue, &queuePriority);
    NSLog(@"queueName:%s,qos_class:%ld queuePriority:%d", queueName, qos_class, queuePriority);
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jianghongbing.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    queueName = dispatch_queue_get_label(concurrentQueue);
    qos_class = dispatch_queue_get_qos_class(concurrentQueue, &queuePriority);
    NSLog(@"queueName:%s,qos_class:%ld queuePriority:%d", queueName, qos_class, queuePriority);
}

//异步执行任务
- (void)asyncExcuteTask {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", NULL);
    dispatch_async(serialQueue, ^{
        NSLog(@"asyncExcuteTask thread:%@,isMainThread:%d, queueName:%s", [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"asyncExcuteTask thread:%@,isMainThread:%d, queueName:%s", [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
    });
    //通过函数的形式来执行任务
    dispatch_async_f(serialQueue, serialContext, excuteAsyncTaskByFunction);
    
}

//同步执行任务
- (void)syncExcuteTask {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_sync(globalQueue, ^{
        int i = 1000;
        while (i-- > 0) {
            NSLog(@"i:%d,thread:%@,isMainThread:%d,queueName:%s", i, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    
    dispatch_sync(globalQueue, ^{
        int n = 1000;
        while (n-- > 0) {
            NSLog(@"n:%d,thread:%@,isMainThread:%d,queueName:%s", n, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    
    dispatch_sync_f(globalQueue, concurrentContext, excuteSyncTaskByFunction);
    
}

void excuteAsyncTaskByFunction(void * context) {
    if (context == serialContext) {
        NSLog(@"通过函数来执行异步任务 thread:%@", [NSThread currentThread]);
    }
}

void excuteSyncTaskByFunction(void * context) {
    if (context == concurrentContext) {
        NSLog(@"通过函数来执行同步任务 thread:%@", [NSThread currentThread]);
    }
}

//主队列
- (void)mainQueueTest {
    //主队列:一般用处理和UI相关的事件,将耗时的操作(如网络,图片处理)方法非主线程中处理
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //在主线程中异步执行任务
    dispatch_async(mainQueue, ^{
        int i = 100;
        while (i-- > 0) {
            NSLog(@"i:%d-执行任务:%@", i, [NSThread currentThread]);
        }
    });
    dispatch_async(mainQueue, ^{
        int m = 100;
        while (m-- > 0) {
            NSLog(@"m:%d-执行任务:%@", m, [NSThread currentThread]);
        }
    });
    
    dispatch_async(mainQueue, ^{
        int n = 100;
        while (n-- > 0) {
            NSLog(@"n:%d-执行任务:%@", n, [NSThread currentThread]);
        }
    });
    
    //在主线中执行同步任务,会导致死锁
//    dispatch_sync(mainQueue, ^{
//        NSLog(@"在主队列中同步执行任务:%@", [NSThread currentThread]);
//    });
}
//全局并发队列
- (void)globalQueueTest {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    //同步执行任务
    dispatch_sync(globalQueue, ^{
        int i = 100;
        while (i-- > 0) {
            NSLog(@"全局队列同步执行任务 i:%d,thread:%@,isMainThread:%d,queueName:%s", i, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    
    dispatch_sync(globalQueue, ^{
        int m = 100;
        while (m-- > 0) {
            NSLog(@"全局队列同步执行任务 m:%d,thread:%@,isMainThread:%d,queueName:%s", m, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    
    //异步执行任务
    dispatch_async(globalQueue, ^{
        int n = 100;
        while (n-- > 0) {
            NSLog(@"全局队列异步执行任务 n:%d,thread:%@,isMainThread:%d,queueName:%s", n, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    dispatch_async(globalQueue, ^{
        int p = 100;
        while (p-- > 0) {
            NSLog(@"全局队列异步执行任务 p:%d,thread:%@,isMainThread:%d,queueName:%s", p, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
    
    dispatch_async(globalQueue, ^{
        int q = 100;
        while (q-- > 0) {
            NSLog(@"全局队列异步执行任务 q:%d,thread:%@,isMainThread:%d,queueName:%s", q, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(globalQueue));
        }
    });
}
//串行队列
- (void)serialQueueTest {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", NULL);
    //同步执行任务
    dispatch_sync(serialQueue, ^{
        int i = 100;
        while (i-- > 0) {
            NSLog(@"串行队列同步执行任务 i:%d,thread:%@,isMainThread:%d,queueName:%s", i, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
        }
    });
    
    dispatch_sync(serialQueue, ^{
        int m = 100;
        while (m-- > 0) {
            NSLog(@"串行队列同步执行任务 m:%d,thread:%@,isMainThread:%d,queueName:%s", m, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
        }
    });
    
    //异步执行任务
    dispatch_async(serialQueue, ^{
        int n = 100;
        while (n-- > 0) {
            NSLog(@"串行队列异步执行任务 n:%d,thread:%@,isMainThread:%d,queueName:%s", n, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
        }
    });
    dispatch_async(serialQueue, ^{
        int p = 100;
        while (p-- > 0) {
            NSLog(@"串行队列异步执行任务 p:%d,thread:%@,isMainThread:%d,queueName:%s", p, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
        }
    });
    
    dispatch_async(serialQueue, ^{
        int q = 100;
        while (q-- > 0) {
            NSLog(@"串行队列异步执行任务 q:%d,thread:%@,isMainThread:%d,queueName:%s", q, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(serialQueue));
        }
    });
}
//并行队列
- (void)concurrentQueueTest {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jianghongbing.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //异步执行任务
    dispatch_async(concurrentQueue, ^{
        int k = 100;
        while (k-- > 0) {
            NSLog(@"并行队列异步执行任务 k:%d,thread:%@,isMainThread:%d,queueName:%s", k, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
    
    //同步执行任务
    dispatch_sync(concurrentQueue, ^{
        int i = 100;
        while (i-- > 0) {
            NSLog(@"并行队列同步执行任务 i:%d,thread:%@,isMainThread:%d,queueName:%s", i, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
    
    dispatch_sync(concurrentQueue, ^{
        int m = 100;
        while (m-- > 0) {
            NSLog(@"并行队列同步执行任务 m:%d,thread:%@,isMainThread:%d,queueName:%s", m, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
    
    //异步执行任务
    dispatch_async(concurrentQueue, ^{
        int n = 100;
        while (n-- > 0) {
            NSLog(@"并行队列异步执行任务 n:%d,thread:%@,isMainThread:%d,queueName:%s", n, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
    dispatch_async(concurrentQueue, ^{
        int p = 100;
        while (p-- > 0) {
            NSLog(@"并行队列异步执行任务 p:%d,thread:%@,isMainThread:%d,queueName:%s", p, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        int q = 100;
        while (q-- > 0) {
            NSLog(@"并行队列异步执行任务 q:%d,thread:%@,isMainThread:%d,queueName:%s", q, [NSThread currentThread], [NSThread isMainThread], dispatch_queue_get_label(concurrentQueue));
        }
    });
}
@end
