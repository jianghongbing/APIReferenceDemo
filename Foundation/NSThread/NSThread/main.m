//
//  main.m
//  NSThread
//
//  Created by jianghongbing on 2017/12/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"
void NSThreadPerformAdditionsMethod(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSThread:表示一个线程,可以在线程住处理任务,在iOS开发中,将一些耗时的操作以及非UI操作常放到非主线程中来处理
        //1.获取主线程和当前线程
        NSThread *mainThread = [NSThread mainThread];
        NSThread *currentThread = [NSThread currentThread];
        //2.创建新的线程并执行其中的任务
        [NSThread detachNewThreadWithBlock:^{
            NSLog(@"thread:%@", [NSThread currentThread]);
        }];

        Target *target = [[Target alloc] init];
        [NSThread detachNewThreadSelector:@selector(excuteSelector) toTarget:target withObject:nil];
//        [NSThread detachNewThreadSelector:@selector(excuteSelcttorWithNumber:) toTarget:[Target class] withObject:@(10)];
        //3.判断当前程序是否为多线程程序
        BOOL isMultiThreadApp = [NSThread isMultiThreaded];
        NSLog(@"isMultiThreadApp:%d", isMultiThreadApp);
        //4.线程信息,仅仅作为一个存储简单信息的地方,不能将其传给线程的target
        NSDictionary *threadDictionary = [mainThread threadDictionary].copy;
        NSLog(@"treadDictionary:%@", threadDictionary);
        //5.线程的睡眠
        NSLog(@"time:%f", CFAbsoluteTimeGetCurrent());
        [NSThread sleepForTimeInterval:3.0]; //睡眠多长时间
//        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0]]; //睡眠至指定日期
        NSLog(@"time:%f", CFAbsoluteTimeGetCurrent());
        //6.线程的优先级,线程的优先级越高,表示其被调度执行的概率越高,并不表示其一定在优先级低的前面执行,优先级的范围在0.0 - 1.0之间,一般线程的优先级为0.5.
//        double threadPriority = [NSThread threadPriority]; //获取当前线程的优先级
//        NSLog(@"threadPrority:%f", threadPriority);
//        [NSThread setThreadPriority:1.0]; //设置当前线程的优先级
//        threadPriority = [NSThread threadPriority]; //获取当前线程的优先级
//        NSLog(@"threadPrority:%f", threadPriority);
        NSQualityOfService service = [mainThread qualityOfService];
        NSLog(@"service:%ld", service);
        //7.线程的相关信息
        NSString *threadName = currentThread.name; //线程名称
        BOOL isMainThread = currentThread.isMainThread; //是否为主线程
        NSInteger stackSize = currentThread.stackSize; //线程的栈大小
        NSLog(@"threadName:%@, isMainThread:%d,stackSize:%ld", threadName, isMainThread, stackSize);
        NSArray *callStackReturnAddresses = [NSThread callStackReturnAddresses]; //线程调用堆栈地址信息
        NSLog(@"addresses:%@", callStackReturnAddresses);
        NSArray *callStackSymbols = [NSThread callStackSymbols];//堆栈调用符号信息
        NSLog(@"symbols:%@", callStackSymbols);
        //8.线程状态
        BOOL isExecuting = currentThread.isExecuting; //判断线程是否正在执行
        BOOL isFinished = currentThread.isFinished; //判断线程是否已经结束
        BOOL isCancelled = currentThread.isCancelled;//判断线程是否被取消
        NSLog(@"isExecuting:%d, isFinished:%d, isCancelled:%d", isExecuting, isFinished, isCancelled);
        //9.取消线程和终止线程
//        [currentThread cancel];
//        [NSThread exit];
        //10.NSObject的NSThread类别中的方法
        NSThreadPerformAdditionsMethod();
        //11.自定义NSTread

    }
    return 0;
}

void NSThreadPerformAdditionsMethod(void) {
    Target *target = [[Target alloc] init];
//    [target performSelectorOnMainThread:@selector(excuteSelector) withObject:nil waitUntilDone:NO];
    [target performSelector:@selector(excuteSelectorTwo) onThread:[NSThread new] withObject:nil waitUntilDone:YES];
    NSLog(@"wait target excute complete");
}
