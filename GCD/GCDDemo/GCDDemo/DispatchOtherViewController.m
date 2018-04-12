//
//  DispatchOtherViewController.m
//  GCDDemo
//
//  Created by pantosoft on 2018/4/9.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DispatchOtherViewController.h"

@interface NSArray (RepeatObject)
+ (NSArray *)arrayWithObject:(id)object repeatCount:(NSUInteger)repeatCount;
@end

@implementation NSArray (RepeatObject)
+ (NSArray *)arrayWithObject:(id)object repeatCount:(NSUInteger)repeatCount {
    if (object == nil || repeatCount <= 0)return nil;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:repeatCount];
    for (int i = 0; i < repeatCount; i++) {
        [array addObject:object];
    }
    return array.copy;
}
@end


@interface DispatchOtherViewController ()
@property (nonatomic, strong) NSMutableArray *numbers;
@property (nonatomic) NSInteger count;
@end

@implementation DispatchOtherViewController





- (void)viewDidLoad {
    [super viewDidLoad];
//    [self dispatchSetTargetQueue];
//    [self dispatchApply];
//    [self dispatchBarrier];
    self.numbers = [NSMutableArray array];
    [self dispatchSemaphore];
    
}

- (void)dispatchSetTargetQueue {
    //设置dispatch_object_t对象targetQueue,第一个参数是要设置的dispatch对象,该参数不能穿mainQueue和globalQueue,第二个参数是目标队列
    //1.如果dispatch对象是dispatch_queue类型,该queue将继承targetQueue的优先级
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jianghongbing.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(concurrentQueue, NULL);
    NSLog(@"qos_class:%u", qos_class);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_set_target_queue(concurrentQueue, globalQueue);
    qos_class = dispatch_queue_get_qos_class(concurrentQueue, NULL);
    NSLog(@"qos_class:%u", qos_class);
    //2.如果targetQueue是serialQueue,还可能会影响到queue的并发性
    //下面的例子,queue中任务都是异步执行的,当设置targetQueue为serialQueue后,任务都同步执行了
    dispatch_queue_t concurrentQueueOne = dispatch_queue_create("com.jianghongbing.concurrentQueueOne", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t concurrentQueueTwo = dispatch_queue_create("com.jianghongbing.concurrentQueueTwo", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t concurrentQueueThree = dispatch_queue_create("com.jianghongbing.concurrentQueueThree", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", NULL);
    
    dispatch_set_target_queue(concurrentQueueOne, serialQueue);
    dispatch_set_target_queue(concurrentQueueTwo, serialQueue);
    dispatch_set_target_queue(concurrentQueueThree, serialQueue);
    
    dispatch_async(concurrentQueueOne, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"concurrentQueueOne i:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueueOne, ^{
        int k = 100;
        while (k-- != 0) {
            NSLog(@"concurrentQueueOne k:%d,thread:%@", k, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueueTwo, ^{
        int m = 100;
        while (m-- != 0) {
            NSLog(@"concurrentQueueTwo:%d,thread:%@", m, [NSThread currentThread]);
        }
    });
    dispatch_async(concurrentQueueThree, ^{
        int n = 100;
        while (n-- != 0) {
            NSLog(@"concurrentQueueThree:%d,thread:%@", n, [NSThread currentThread]);
        }
    });
    //3.如果设置的对象是dispatch_source,将会将dispatch_source的事件处理和事件取消等相关事务提交到target_queue
    //4.如果设置的对象是dispatch_io,io的执行将会发生在targetQueue
}

- (void)dispatchApply {
    //dispatch_apply:提交一个执行多次的block到queue中,如果queue是并发的queue,则可以同时执行多次该block
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_apply(100, globalQueue, ^(size_t index) {
        NSLog(@"index:%zi,thread:%@", index, [NSThread currentThread]);
    });
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.jianghongbing.serialQueue", NULL);
//    dispatch_apply(10, serialQueue, ^(size_t index) {
//        NSLog(@"index:%zi, thread:%@", index, [NSThread currentThread]);
//    });
}

- (void)dispatchBarrier {
    //dispatch_barrier:往队列中添加barrierBlock,barrierBlock在队列中执行的顺序,必须等到在barrier block之前添加的任务执行完成后,才能执行barrier block的任务,在barrier block后面添加的任务需要到到barrierblock的任务执行完成后才能执行.将barrierBlock添加到全局的队列中,貌似没有这样的作用,添加到自己创建的queue中才会有这样的作用
    //dispatch_barrier_async不会阻塞当前线程,不需要等到block的任务执行完成就立即返回,执行后面的代码,和其他的async的函数类似
    //dispatch_barrier_sync会阻塞当前线程,需要等待返回,才能执行后面的代码,和其他的sync函数类似
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.jianghongbing.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"blockOne i:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    dispatch_async(concurrentQueue, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"blockTwo:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"blockThree:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    
//    dispatch_barrier_async(concurrentQueue, ^{
//        int i = 100;
//        while (i-- != 0) {
//            NSLog(@"barrierBlockOne:%d,thread:%@", i, [NSThread currentThread]);
//        }
//    });
    dispatch_barrier_sync(concurrentQueue, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"barrierBlockOne:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    dispatch_async(concurrentQueue, ^{
        int i = 100;
        while (i-- != 0) {
            NSLog(@"blockFour:%d,thread:%@", i, [NSThread currentThread]);
        }
    });
    
    int i = 100;
    while (i-- != 0) {
        NSLog(@"noBlock:%d,thread:%@", i, [NSThread currentThread]);
    }
    
}
- (void)dispatchSemaphore {
    //dispatch信号量,类似于过马路的红路灯,红灯禁止通行,需要等待,等到绿灯亮了,放行.
    //常用于控制线程对数据的访问,保护数据的安全,如(当多个线程去修改同一份数据,可能产生数据错误的问题以及产生异常的问题,可以通过dispatchSemppore来解决该问题
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    //semapore的创建, value表示当前的值,创建semphore时,值的大小必须大于或者等于0,否则返回NULL,当值为0时进入等待状态,如果有信号过来,放行,否则一直等待到超时放行;值大于0时放行,值得大小决定了最多允许放行的通道
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_group_async(group, globalQueue, ^{
        //等待当前semaphore,并将semaphore的值减1,如果semanphore的value的值大于等于0,则可以执行下面的代码,如果小于0,如果没有超过所指定的time,则一直等待信号的到来,才执行下面的代码,否则不会执行后面的代码,如果超过指定的时间,也会执行无论信号的值为多少,都会执行后面的代码,每使用一次wait,会将semampore的value值减1
        long result = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"result:%ld", result);
        int i = 0;
        while (i++ < 100) {
            [self addNumber];
        }
        //semapore发送信号,semaphore的value加1
        result = dispatch_semaphore_signal(semaphore);
        NSLog(@"result:%ld", result);
    });
    
    dispatch_group_async(group, globalQueue, ^{
        int q = 0;
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        while (q++ < 100) {
            [self addNumber];
        }
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_group_notify(group, globalQueue, ^{
        NSLog(@"numbers:%@", self.numbers);
    });
}

- (void)addNumber {
    _count += 1;
    [_numbers addObject:@(_count)];
}


- (IBAction)excuteCode:(id)sender {
    //dispatch once,在整个app的生命周期只执行一次该block,常用于单例的初始化
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        //这里面的代码只会执行一次
        NSLog(@"执行一次的代码 predicate:%ld", predicate);
    });
    NSLog(@"执行多次的代码 predicate:%ld", predicate);
}
@end


